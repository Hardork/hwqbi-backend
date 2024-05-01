package com.hwq.bi;

import com.hwq.bi.config.WebSocketConfig;
import com.hwq.bi.mongo.entity.ChartData;
import org.bson.types.ObjectId;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.autoconfigure.ImportAutoConfiguration;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.web.socket.server.standard.ServerEndpointExporter;

import javax.annotation.Resource;
import java.util.*;

@RunWith(SpringRunner.class)
@ImportAutoConfiguration(exclude = WebSocketConfig.class)
@SpringBootTest
//由于是Web项目，Junit需要模拟ServletContext，因此我们需要给我们的测试类加上@WebAppConfiguration。
@WebAppConfiguration
public class TmallApplicationTests {

    @Resource
    private MongoTemplate mongoTemplate;

    @MockBean
    private ServerEndpointExporter serverEndpointExporter;

    @Before
    public void init() {
        System.out.println("开始测试-----------------");
    }

    @After
    public void after() {
        System.out.println("测试结束-----------------");
    }

    @Test
    public void testMongoDB() {

    }


    public ChartData getDataMap(List<String> header, List<String> data) {
        if (header.size() != data.size()) {
            return null;
        }
        HashMap<String, Object> map = new HashMap<>();
        for (int i = 0; i < header.size(); i++) {
            map.put(header.get(i), data.get(i));

        }
        return new ChartData()
                .setData(map);
    }

    @Test
    public void insertMongoDB() {
        Long chartId = 12345678L;
        for (int i = 0; i < 10; i++) {
            ChartData chartData = new ChartData();
            Map<String, Object> map = new HashMap<>();
            map.put("name", "某人" + i);
            map.put("age", i);
            map.put("address", "福建省");
            chartData.setData(map);
            mongoTemplate.insert(chartData, "chart_" + chartId);
        }
    }

    @Test
    public void find() {
        Query query = new Query();
        List<ChartData> chart = mongoTemplate.findAll(ChartData.class, "chart_" + "12345678");
        System.out.println(chart);
    }

    @Test
    public void findOne() {
        Long chartId = 12345678L;
        Criteria criteria = Criteria.where("id").is("662a06a27b8b9e067e4d34b3");
        Query query = new Query();
        query.addCriteria(criteria);
        ChartData chart = mongoTemplate.findOne(query, ChartData.class, "chart_" + chartId);
        System.out.println(chart);
    }

    @Test
    public void getByPage() {
        Long chartId = 12345678L;
        // 创建分页请求对象
        Pageable pageable = PageRequest.of(0, 10);
        Query query = new Query();
        query.with(pageable);
        // 执行查询
        System.out.println(mongoTemplate.find(query, ChartData.class, "chart_" + chartId));
    }

//    @Test
//    public void deleteById() {
//        mongoTemplate.remove()
//    }

    @Test
    public void updateMongoDB() {
        Long chartId = 12345678L;
        String field = "name";
        String newVal = "库里";
        Criteria criteria = Criteria.where("id").is("662a06a27b8b9e067e4d34b3");
        Query query = new Query();

        Update update = new Update().set(field, newVal);
        mongoTemplate.updateFirst(query, update, "chart_" + chartId);
    }
}
