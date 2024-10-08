package com.hwq.dataloom.mq.producer;

import cn.hutool.core.util.StrUtil;
import com.hwq.dataloom.constants.CouponMessageConstant;
import com.hwq.dataloom.mq.dto.BasicDTO;
import com.hwq.dataloom.mq.event.CouponTaskDirectEvent;
import com.hwq.dataloom.mq.event.CouponTemplateDirectEvent;
import com.hwq.dataloom.mq.wrapper.MessageWrapper;
import org.apache.commons.lang3.StringUtils;
import org.apache.rocketmq.client.producer.SendResult;
import org.apache.rocketmq.common.message.MessageConst;
import org.apache.rocketmq.spring.core.RocketMQTemplate;
import org.springframework.messaging.Message;
import org.springframework.messaging.support.MessageBuilder;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;

/**
 * @author HWQ
 * @date 2024/8/30 15:26
 * @description 优惠券推送任务生产者(将任务id推送到解析excel的队列中)
 */
@Component
public class CouponExcelAnalysisMessageProducer {
    @Resource
    private RocketMQTemplate rocketMQTemplate;

    /**
     * 构建请求类
     * @param couponTaskDirectEvent 延迟消息
     * @return 请求类
     */
    public BasicDTO buildBaseSendDTO(CouponTaskDirectEvent couponTaskDirectEvent) {
        Long couponTaskId = couponTaskDirectEvent.getCouponTaskId();
        return BasicDTO.builder()
                .eventName("优惠券立刻推送")
                .key(String.valueOf(couponTaskId))
                .topic(CouponMessageConstant.EXCEL_ANALYSIS_TOPIC)
                .timeout(2000L)
                .build();
    }

    /**
     * 构建payload
     * @param couponTaskDirectEvent 延迟消息
     * @param basicDTO 请求类
     * @return payload
     */
    public Message<?> buildMessage(CouponTaskDirectEvent couponTaskDirectEvent, BasicDTO basicDTO) {
        return MessageBuilder
                .withPayload(new MessageWrapper<>(basicDTO.getKey(), couponTaskDirectEvent))
                .setHeader(MessageConst.PROPERTY_KEYS, basicDTO.getKey())
                .setHeader(MessageConst.PROPERTY_TAGS, basicDTO.getTag())
                .build();

    }

    /**
     * 发送延迟消息
     * @param couponTaskDirectEvent 延迟消息
     * @return 发送结果
     */
    public SendResult sendMessage(CouponTaskDirectEvent couponTaskDirectEvent) {
        BasicDTO basicDTO = buildBaseSendDTO(couponTaskDirectEvent);
        StringBuilder des = StrUtil.builder().append(basicDTO.getTopic());
        if (StringUtils.isNotEmpty(basicDTO.getTag())) {
            des.append(":").append(basicDTO.getTag());
        }
        return rocketMQTemplate.syncSend(String.valueOf(des), buildMessage(couponTaskDirectEvent, basicDTO));
    }


}
