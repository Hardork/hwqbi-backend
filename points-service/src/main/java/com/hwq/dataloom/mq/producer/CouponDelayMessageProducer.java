package com.hwq.dataloom.mq.producer;

import cn.hutool.core.util.StrUtil;
import com.hwq.dataloom.constants.CouponMessageConstant;
import com.hwq.dataloom.framework.errorcode.ErrorCode;
import com.hwq.dataloom.framework.exception.BusinessException;
import com.hwq.dataloom.mq.dto.BasicDTO;
import com.hwq.dataloom.mq.event.CouponTemplateDelayEvent;
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
 * @date 2024/8/30 13:53
 * @description 定时优惠券生产者
 */
@Component
public class CouponDelayMessageProducer {
    @Resource
    private RocketMQTemplate rocketMQTemplate;

    /**
     * 构建请求类
     * @param couponTemplateDelayEvent 延迟消息
     * @return 请求类
     */
    public BasicDTO buildBaseSendDTO(CouponTemplateDelayEvent couponTemplateDelayEvent) {
        Long couponTemplateId = couponTemplateDelayEvent.getCouponTemplateId();
        Long delayTime = couponTemplateDelayEvent.getDelayTime();
        return BasicDTO.builder()
                .eventName("优惠券定时推送")
                .key(String.valueOf(couponTemplateId))
                .topic(CouponMessageConstant.DELAY_MESSAGE_TOPIC)
                .delayTime(delayTime)
                .build();
    }

    /**
     * 构建payload
     * @param couponTemplateDelayEvent 延迟消息
     * @param basicDTO 请求类
     * @return payload
     */
    public Message<?> buildMessage(CouponTemplateDelayEvent couponTemplateDelayEvent, BasicDTO basicDTO) {
        return MessageBuilder
                .withPayload(new MessageWrapper<>(basicDTO.getKey(), couponTemplateDelayEvent))
                .setHeader(MessageConst.PROPERTY_KEYS, basicDTO.getKey())
                .setHeader(MessageConst.PROPERTY_TAGS, basicDTO.getTag())
                .build();

    }

    /**
     * 发送延迟消息
     * @param couponTemplateDelayEvent 延迟消息
     * @return 发送结果
     */
    public SendResult sendMessage(CouponTemplateDelayEvent couponTemplateDelayEvent) {
        BasicDTO basicDTO = buildBaseSendDTO(couponTemplateDelayEvent);
        StringBuilder des = StrUtil.builder().append(basicDTO.getTopic());
        if (StringUtils.isNotEmpty(basicDTO.getTag())) {
            des.append(":").append(basicDTO.getTag());
        }
        // 判断类型
        if (basicDTO.getDelayTime() == null) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR, "延迟时间不得为空");
        }
        return rocketMQTemplate.syncSendDelayTimeMills(String.valueOf(des), buildMessage(couponTemplateDelayEvent, basicDTO), basicDTO.getDelayTime());
    }
}
