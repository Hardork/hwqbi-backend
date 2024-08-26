package com.hwq.dataloom.config.job;

import cn.hutool.json.JSONUtil;
import com.alibaba.fastjson.JSONObject;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.common.net.HttpHeaders;
import com.hwq.dataloom.model.dto.newdatasource.ApiDefinition;
import com.hwq.dataloom.model.entity.CoreDatasourceTask;
import com.hwq.dataloom.service.CoreDatasourceTaskService;
import com.hwq.dataloom.utils.ApiUtils;
import com.xxl.job.core.biz.AdminBiz;
import com.xxl.job.core.context.XxlJobHelper;
import com.xxl.job.core.handler.annotation.XxlJob;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.apache.groovy.util.BeanUtils;
import org.apache.hc.client5.http.classic.methods.HttpPost;
import org.apache.hc.client5.http.impl.classic.CloseableHttpClient;
import org.apache.hc.client5.http.impl.classic.CloseableHttpResponse;
import org.apache.hc.client5.http.impl.classic.HttpClients;
import org.apache.hc.core5.http.ContentType;
import org.apache.hc.core5.http.ParseException;
import org.apache.hc.core5.http.io.entity.EntityUtils;
import org.apache.hc.core5.http.io.entity.StringEntity;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

import javax.annotation.Resource;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Component
@Slf4j
public class MyJobHandler {

    @Resource
    private CoreDatasourceTaskService coreDatasourceTaskService;

    @Value("${xxl.job.admin.addresses:''}")
    private String adminAddresses;

    @Value("${xxl.job.admin.login-username:admin}")
    private String loginUsername;

    @Value("${xxl.job.admin.login-pwd:123456}")
    private String loginPwd;

    private static final String ADMIN_ADD_JOB_URL = "http://127.0.0.1:8088/xxl-job-admin/jobinfo/add";
    private static final String ADMIN_TRIGGER_JOB_URL = "http://127.0.0.1:8088/xxl-job-admin/jobinfo/trigger";

    /**
     * 定时任务 根据API接口信息更新API数据
     * @throws IOException
     * @throws ParseException
     */
    @XxlJob("dataLoomJobHandler")
    public void DataLoomJobHandler() throws IOException, ParseException {
        String jobParam = XxlJobHelper.getJobParam();
        ApiDefinition apiDefinition = JSONUtil.toBean(jobParam, ApiDefinition.class);
        CloseableHttpResponse response = ApiUtils.getApiResponse(apiDefinition);
        String responseBody = EntityUtils.toString(response.getEntity());
        System.out.println(responseBody);
        // TODO 执行并保存到数据库中

    }

    /**
     * 清除过期的定时任务 需要手动注册
     * @throws IOException
     * @throws ParseException
     */
    @XxlJob("cleanUpExpiredJobs")
    public void cleanUpExpiredJobs() throws IOException, ParseException {
        List<CoreDatasourceTask> list = coreDatasourceTaskService.list();
        Date now = new Date();
        for (CoreDatasourceTask task : list) {
            if (task.getEndTime() != null && now.after(task.getEndTime())) {
                // 停止并删除任务
                log.info("Job [{}] has expired, stopping and deleting it", task.getId());
                int xxlJobId = coreDatasourceTaskService.getById(task.getId()).getJobId();
                coreDatasourceTaskService.removeById(task.getId());
                try {
                    XxlJobUtil.login(adminAddresses,loginUsername,loginPwd);
                } catch (IOException e) {
                    throw new RuntimeException(e);
                }
                JSONObject response = XxlJobUtil.stopJob(adminAddresses, xxlJobId);
                if (response.containsKey("code") && 200 == (Integer) response.get("code")) {
                    System.out.println("任务停止成功");
                } else {
                    System.out.println("任务停止失败");
                }
            }
        }
    }



}