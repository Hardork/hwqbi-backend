create database if not exists bi;

use bi;

create table if not exists bi.ai_role
(
    id            bigint                                  not null
        primary key,
    assistantName varchar(255)  default ''                null comment '助手名称',
    userId        bigint                                  not null comment '创建人Id',
    type          varchar(255)                            null comment '助手类型',
    historyTalk   tinyint(1)    default 0                 null comment '历史对话',
    functionDes   varchar(2048) default ''                null comment '功能描述',
    inputModel    varchar(2048) default ''                null comment '输入模型',
    roleDesign    varchar(2048)                           null comment '角色设定',
    targetWork    varchar(2048) default ''                null comment '目标任务',
    requirement   varchar(2048) default ''                null comment '需求说明',
    style         varchar(255)  default ''                null comment '风格设定',
    otherRequire  varchar(2048) default ''                null comment '其它示例',
    createTime    datetime      default CURRENT_TIMESTAMP not null comment '创建时间',
    updateTime    datetime      default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '更新时间',
    isDelete      tinyint       default 0                 not null comment '是否删除'
)
    comment '上线的助手';

INSERT INTO `ai_role` (`id`, `assistantName`, `userId`, `type`, `historyTalk`, `functionDes`, `inputModel`, `roleDesign`, `targetWork`, `requirement`, `style`, `otherRequire`, `createTime`, `updateTime`, `isDelete`) VALUES (1706980023632138241, 'goat', 1697633200786403330, '学习', 0, '帮助后端工程师解答问题', '比如当你输入：空指针问题怎么解决，我会为你解答', '你是一名专业的后端工程师', '请给出详细的解决方案', '请给出详细的解决方案', '简洁明了', '', '2023-09-27 18:32:06', '2023-09-27 18:32:06', 0);
INSERT INTO `ai_role` (`id`, `assistantName`, `userId`, `type`, `historyTalk`, `functionDes`, `inputModel`, `roleDesign`, `targetWork`, `requirement`, `style`, `otherRequire`, `createTime`, `updateTime`, `isDelete`) VALUES (1707645538323144706, '编程助手', 1697633200786403330, '编程', 0, '你可以给我提出学习建议', '比如：我输入怎么学习mybatis，你能给我学习mybatis的建议', '你是编程方面的专家', '给我学习编程的建议', '要求给出的建议是有意义的', '简介明了', '', '2023-09-29 14:36:37', '2023-09-29 14:36:37', 0);
INSERT INTO `ai_role` (`id`, `assistantName`, `userId`, `type`, `historyTalk`, `functionDes`, `inputModel`, `roleDesign`, `targetWork`, `requirement`, `style`, `otherRequire`, `createTime`, `updateTime`, `isDelete`) VALUES (1707648311894745090, 'basdas', 1697633200786403330, '编程', 1, 'basdas', 'basdas', 'basdas', 'basdas', 'basdas', 'basdas', '', '2023-09-29 14:47:38', '2023-09-29 14:47:46', 1);
INSERT INTO `ai_role` (`id`, `assistantName`, `userId`, `type`, `historyTalk`, `functionDes`, `inputModel`, `roleDesign`, `targetWork`, `requirement`, `style`, `otherRequire`, `createTime`, `updateTime`, `isDelete`) VALUES (1707649179473944578, 'asdas', 1697633200786403330, '创作', 1, 'asdas', 'asdas', 'asdas', 'asdas', 'asdas', 'asdas', '', '2023-09-29 14:51:05', '2023-09-29 14:51:09', 1);
INSERT INTO `ai_role` (`id`, `assistantName`, `userId`, `type`, `historyTalk`, `functionDes`, `inputModel`, `roleDesign`, `targetWork`, `requirement`, `style`, `otherRequire`, `createTime`, `updateTime`, `isDelete`) VALUES (1707649534085570562, 'asdas', 1697633200786403330, '编程', 1, 'asdasd', 'dasda', 'asdas', 'sadas', 'dasd', 'asda', '', '2023-09-29 14:52:30', '2023-09-29 14:52:33', 1);
INSERT INTO `ai_role` (`id`, `assistantName`, `userId`, `type`, `historyTalk`, `functionDes`, `inputModel`, `roleDesign`, `targetWork`, `requirement`, `style`, `otherRequire`, `createTime`, `updateTime`, `isDelete`) VALUES (1710206785442934785, '前端助手', 1697633200786403330, '编程', 1, '帮助解答前端的问题', '比如我输入怎么让div浮动，你能给我回答', '你是一名专业的前端工程师', '帮助解答前端的问题', '帮助解答前端的问题', '简介明了', '', '2023-10-06 16:14:06', '2023-10-06 16:14:06', 0);


create table if not exists bi.chart
(
    id          bigint auto_increment comment 'id'
        primary key,
    goal        text                                   null comment '分析目标',
    name        varchar(128)                           null comment '图表名称',
    chartData   text                                   null comment '图表数据',
    chartType   varchar(128)                           null comment '图表类型',
    genChart    text                                   null comment '生成的图表数据',
    genResult   text                                   null comment '生成的分析结论',
    status      varchar(128) default 'wait'            not null comment 'wait,running,succeed,failed',
    execMessage text                                   null comment '执行信息',
    userDataId  bigint                                 not null comment '引用数据',
    userId      bigint                                 null comment '创建用户 id',
    createTime  datetime     default CURRENT_TIMESTAMP not null comment '创建时间',
    updateTime  datetime     default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '更新时间',
    isDelete    tinyint      default 0                 not null comment '是否删除'
)
    comment '图表信息表' collate = utf8mb4_unicode_ci;

INSERT INTO `chart` (`id`, `goal`, `name`, `chartData`, `chartType`, `genChart`, `genResult`, `status`, `execMessage`, `userId`, `createTime`, `updateTime`, `isDelete`) VALUES (1700538268766515201, '帮我分析一下网站用户增长量', '用户增长', '日期,用户增长\n2023/7/11,10\n2023/7/12,20\n2023/7/13,30\n2023/7/14,0\n2023/7/15,40\n2023/7/16,40\n', '折线图', '{\n  \"xAxis\": {\n    \"type\": \"category\",\n    \"data\": [\"2023/7/11\", \"2023/7/12\", \"2023/7/13\", \"2023/7/14\", \"2023/7/15\", \"2023/7/16\"]\n  },\n  \"yAxis\": {\n    \"type\": \"value\"\n  },\n  \"series\": [\n    {\n      \"data\": [10, 20, 30, 0, 40, 40],\n      \"type\": \"line\"\n    }\n  ]\n}', '根据提供的原始数据，可以得出以下结论：\n1. 用户增长量呈现整体上升趋势，除了2023/7/14之外，其他日期都有增长。\n2. 增长量最大的日期是2023/7/15，达到了40。\n3. 2023/7/14是用户增长量的一个异常值，数据为0。可能需要进一步调查和分析。\n4. 建议重点关注用户增长量的变化情况，以及与其他因素的关联性，进一步优化增长策略。', 'succeed', '系统繁忙', 1697633200786403330, '2023-09-09 23:54:52', '2023-10-23 19:51:21', 0);
INSERT INTO `chart` (`id`, `goal`, `name`, `chartData`, `chartType`, `genChart`, `genResult`, `status`, `execMessage`, `userId`, `createTime`, `updateTime`, `isDelete`) VALUES (1703411155764637697, '分析目标', '分析目标', '日期,用户增长\n2023/7/11,10\n2023/7/12,20\n2023/7/13,30\n2023/7/14,0\n2023/7/15,40\n2023/7/16,40\n', '雷达图', '{\n  \"title\": {\n    \"text\": \"用户增长情况\"\n  },\n  \"tooltip\": {},\n  \"radar\": {\n    \"indicator\": [\n      {\"name\": \"日期\", \"max\": 100},\n      {\"name\": \"用户增长\", \"max\": 100}\n    ],\n    \"center\": [\"50%\", \"50%\"],\n    \"radius\": \"60%\"\n  },\n  \"series\": [{\n    \"type\": \"radar\",\n    \"data\": [\n      {\n        \"value\": [10, 10],\n        \"name\": \"2023/7/11\"\n      },\n      {\n        \"value\": [20, 20],\n        \"name\": \"2023/7/12\"\n      },\n      {\n        \"value\": [30, 30],\n        \"name\": \"2023/7/13\"\n      },\n      {\n        \"value\": [0, 0],\n        \"name\": \"2023/7/14\"\n      },\n      {\n        \"value\": [40, 40],\n        \"name\": \"2023/7/15\"\n      },\n      {\n        \"value\": [40, 40],\n        \"name\": \"2023/7/16\"\n      }\n    ]\n  }]\n}', '根据雷达图可视化分析结果，可以得出以下结论：\n1. 2023年7月11日用户增长数量为10，增长比较平稳。\n2. 2023年7月12日用户增长数量为20，相较于前一天有一定程度的增加。\n3. 2023年7月13日用户增长数量为30，相较于前一天有一定程度的增加。\n4. 2023年7月14日用户增长数量为0，出现停滞或下降的情况。\n5. 2023年7月15日用户增长数量为40，相较于前一天有一定程度的增加。\n6. 2023年7月16日用户增长数量为40，维持了前一天的增长水平。\n通过雷达图的可视化分析，我们可以对每天的用户增长情况有一个直观的了解，及时发现增长趋势和异常情况，为后续决策提供参考。', 'succeed', NULL, 1697633200786403330, '2023-09-17 22:10:42', '2023-09-17 22:10:54', 0);
INSERT INTO `chart` (`id`, `goal`, `name`, `chartData`, `chartType`, `genChart`, `genResult`, `status`, `execMessage`, `userId`, `createTime`, `updateTime`, `isDelete`) VALUES (1705496627374481409, '预测网站用户增长量', 'predict', '日期,用户增长\n2023/7/11,10\n2023/7/12,20\n2023/7/13,30\n2023/7/14,0\n2023/7/15,40\n2023/7/16,40\n', '堆叠图', '{\n  \"title\": {\n    \"text\": \"网站用户增长量预测\",\n    \"left\": \"center\"\n  },\n  \"tooltip\": {\n    \"trigger\": \"axis\",\n    \"axisPointer\": {\n      \"type\": \"shadow\"\n    }\n  },\n  \"legend\": {\n    \"data\": [\"用户增长\"]\n  },\n  \"grid\": {\n    \"left\": \"3%\",\n    \"right\": \"4%\",\n    \"bottom\": \"3%\",\n    \"containLabel\": true\n  },\n  \"xAxis\": {\n    \"type\": \"category\",\n    \"data\": [\"2023/7/11\", \"2023/7/12\", \"2023/7/13\", \"2023/7/14\", \"2023/7/15\", \"2023/7/16\"]\n  },\n  \"yAxis\": {\n    \"type\": \"value\"\n  },\n  \"series\": [\n    {\n      \"name\": \"用户增长\",\n      \"type\": \"bar\",\n      \"stack\": \"总量\",\n      \"data\": [10, 20, 30, 0, 40, 40]\n    }\n  ]\n}', '根据给定的数据，可以看出网站的用户增长情况如下：\n\n- 2023/7/11，用户增长为10\n- 2023/7/12，用户增长为20\n- 2023/7/13，用户增长为30\n- 2023/7/14，用户增长为0\n- 2023/7/15，用户增长为40\n- 2023/7/16，用户增长为40\n\n可以观察到用户增长量在最初几天是逐渐增加的，然后在第四天没有增长，第五天和第六天又出现了增长。根据当前的趋势，可以预测接下来的用户增长量可能会保持稳定或者继续增加。', 'succeed', NULL, 1697633200786403330, '2023-09-23 16:17:37', '2023-09-23 16:17:57', 0);
INSERT INTO `chart` (`id`, `goal`, `name`, `chartData`, `chartType`, `genChart`, `genResult`, `status`, `execMessage`, `userId`, `createTime`, `updateTime`, `isDelete`) VALUES (1705845831087284226, '用户后续情况', '用户后续情况', '日期,用户增长\n2023/7/11,10\n2023/7/12,20\n2023/7/13,30\n2023/7/14,0\n2023/7/15,40\n2023/7/16,40\n', '折线图', '{\n  \"title\": {\n    \"text\": \"用户后续情况\",\n    \"x\": \"center\"\n  },\n  \"tooltip\": {\n    \"trigger\": \"axis\"\n  },\n  \"xAxis\": {\n    \"type\": \"category\",\n    \"data\": [\"2023/7/11\", \"2023/7/12\", \"2023/7/13\", \"2023/7/14\", \"2023/7/15\", \"2023/7/16\"]\n  },\n  \"yAxis\": {\n    \"type\": \"value\"\n  },\n  \"series\": [{\n    \"data\": [10, 20, 30, 0, 40, 40],\n    \"type\": \"line\",\n    \"smooth\": true\n  }]\n}', '根据数据分析后续情况，可以得出以下结论：\n1. 用户增长在2023年7月11日至2023年7月13日持续增加，最高达到30。\n2. 用户增长在2023年7月14日突然下降为0，可能出现了问题导致用户流失。\n3. 用户增长在2023年7月15日恢复增加，最终达到40，但没有再继续增加。\n4. 根据该数据，可以进一步分析问题出现的原因，并采取相应的措施进行用户回流。', 'succeed', NULL, 1697633200786403330, '2023-09-24 15:25:13', '2023-09-24 15:25:27', 0);
INSERT INTO `chart` (`id`, `goal`, `name`, `chartData`, `chartType`, `genChart`, `genResult`, `status`, `execMessage`, `userId`, `createTime`, `updateTime`, `isDelete`) VALUES (1705847327325425666, '分析用户', '分析用户', '日期,用户增长\n2023/7/11,10\n2023/7/12,20\n2023/7/13,30\n2023/7/14,0\n2023/7/15,40\n2023/7/16,40\n', '堆叠图', '{\n  \"tooltip\": {\n    \"trigger\": \"axis\",\n    \"axisPointer\": {\n      \"type\": \"shadow\"\n    }\n  },\n  \"legend\": {\n    \"data\": [\"用户增长\"]\n  },\n  \"xAxis\": {\n    \"type\": \"category\",\n    \"data\": [\"2023/7/11\", \"2023/7/12\", \"2023/7/13\", \"2023/7/14\", \"2023/7/15\", \"2023/7/16\"]\n  },\n  \"yAxis\": {\n    \"type\": \"value\"\n  },\n  \"series\": [\n    {\n      \"name\": \"用户增长\",\n      \"type\": \"bar\",\n      \"stack\": \"总量\",\n      \"data\": [10, 20, 30, 0, 40, 40]\n    }\n  ]\n}', '根据给定的数据，可以看出用户的增长情况如下：\n- 2023/7/11日新增10个用户\n- 2023/7/12日新增20个用户\n- 2023/7/13日新增30个用户\n- 2023/7/14日没有新增用户\n- 2023/7/15日新增40个用户\n- 2023/7/16日新增40个用户', 'succeed', NULL, 1697633200786403330, '2023-09-24 15:31:10', '2023-09-24 15:31:20', 0);
INSERT INTO `chart` (`id`, `goal`, `name`, `chartData`, `chartType`, `genChart`, `genResult`, `status`, `execMessage`, `userId`, `createTime`, `updateTime`, `isDelete`) VALUES (1705848183642918914, '分析用户', '分析用户', '日期,用户增长\n2023/7/11,10\n2023/7/12,20\n2023/7/13,30\n2023/7/14,0\n2023/7/15,40\n2023/7/16,40\n', '柱状图', '{\n  \"xAxis\": {\n    \"type\": \"category\",\n    \"data\": [\"2023/7/11\", \"2023/7/12\", \"2023/7/13\", \"2023/7/14\", \"2023/7/15\", \"2023/7/16\"]\n  },\n  \"yAxis\": {\n    \"type\": \"value\"\n  },\n  \"series\": [{\n    \"data\": [10, 20, 30, 0, 40, 40],\n    \"type\": \"bar\"\n  }]\n}', '从原始数据中可以看出，在日期为2023/7/14的一天中，用户增长为0，而其他日期的用户增长都大于0。\n\n由此可以得出结论：\n- 用户增长呈现整体上升的趋势，但在某个特定日期出现了用户增长为0的异常情况。\n- 需要进一步调查和分析为何在该日期用户增长为0，可能是由于系统故障或其他原因导致。', 'succeed', NULL, 1697633200786403330, '2023-09-24 15:34:34', '2023-09-24 15:34:44', 0);
INSERT INTO `chart` (`id`, `goal`, `name`, `chartData`, `chartType`, `genChart`, `genResult`, `status`, `execMessage`, `userId`, `createTime`, `updateTime`, `isDelete`) VALUES (1705848653535096833, '分析用户', '分析用户', '日期,用户增长\n2023/7/11,10\n2023/7/12,20\n2023/7/13,30\n2023/7/14,0\n2023/7/15,40\n2023/7/16,40\n', '雷达图', '{\n  \"title\": {\n    \"text\": \"用户增长雷达图\"\n  },\n  \"tooltip\": {},\n  \"radar\": {\n    \"indicator\": [\n      {\"name\": \"2023/7/11\"},\n      {\"name\": \"2023/7/12\"},\n      {\"name\": \"2023/7/13\"},\n      {\"name\": \"2023/7/14\"},\n      {\"name\": \"2023/7/15\"},\n      {\"name\": \"2023/7/16\"}\n    ],\n    \"shape\": \"circle\"\n  },\n  \"series\": [{\n    \"name\": \"用户增长\",\n    \"type\": \"radar\",\n    \"data\": [\n      {\n        \"value\": [10, 20, 30, 0, 40, 40],\n        \"name\": \"用户增长\"\n      }\n    ]\n  }]\n}', '根据数据分析，我们可以得出以下结论：\n1. 2023年7月11日的用户增长量为10。\n2. 2023年7月12日的用户增长量为20。\n3. 2023年7月13日的用户增长量为30。\n4. 2023年7月14日的用户增长量为0。\n5. 2023年7月15日的用户增长量为40。\n6. 2023年7月16日的用户增长量为40。\n从图表来看，用户增长呈现出相对稳定的状态，其中2023年7月15日是用户增长的高峰期。\n用户在2023年7月14日停止增长，需要进一步分析原因并采取措施以提高用户增长。', 'succeed', NULL, 1697633200786403330, '2023-09-24 15:36:26', '2023-09-24 15:36:41', 0);
INSERT INTO `chart` (`id`, `goal`, `name`, `chartData`, `chartType`, `genChart`, `genResult`, `status`, `execMessage`, `userId`, `createTime`, `updateTime`, `isDelete`) VALUES (1705849967329423362, '用户分析', '用户分析', '日期,用户增长\n2023/7/11,10\n2023/7/12,20\n2023/7/13,30\n2023/7/14,0\n2023/7/15,40\n2023/7/16,40\n', '堆叠图', '{\n  \"title\": {\n    \"text\": \"用户增长情况\"\n  },\n  \"tooltip\": {\n    \"trigger\": \"axis\",\n    \"axisPointer\": {\n      \"type\": \"shadow\"\n    }\n  },\n  \"legend\": {\n    \"data\": [\"用户增长\"]\n  },\n  \"xAxis\": {\n    \"type\": \"category\",\n    \"data\": [\"2023/7/11\", \"2023/7/12\", \"2023/7/13\", \"2023/7/14\", \"2023/7/15\", \"2023/7/16\"]\n  },\n  \"yAxis\": {\n    \"type\": \"value\"\n  },\n  \"series\": [\n    {\n      \"name\": \"用户增长\",\n      \"type\": \"bar\",\n      \"stack\": \"总量\",\n      \"data\": [10, 20, 30, 0, 40, 40]\n    }\n  ]\n}', '根据提供的用户增长数据，可以得出以下结论：\n1. 2023年7月11日新增了10个用户；\n2. 2023年7月12日新增了20个用户；\n3. 2023年7月13日新增了30个用户；\n4. 2023年7月14日新增了0个用户，没有新增用户；\n5. 2023年7月15日新增了40个用户；\n6. 2023年7月16日新增了40个用户；\n可以看出，用户增长在7月11日和7月12日有一定的增长，接着在7月13日达到最高峰，但在7月14日停止了新增用户，之后在7月15日和7月16日又有一定的增长，整体呈现出波动上升的趋势。', 'succeed', NULL, 1697633200786403330, '2023-09-24 15:41:40', '2023-09-24 15:41:54', 0);
INSERT INTO `chart` (`id`, `goal`, `name`, `chartData`, `chartType`, `genChart`, `genResult`, `status`, `execMessage`, `userId`, `createTime`, `updateTime`, `isDelete`) VALUES (1705850419190181889, '分析需求', '分析需求', '日期,用户增长\n2023/7/11,10\n2023/7/12,20\n2023/7/13,30\n2023/7/14,0\n2023/7/15,40\n2023/7/16,40\n', '饼图', '{\n  \"tooltip\": {\n    \"trigger\": \"item\",\n    \"formatter\": \"{a} <br/>{b}: {c} ({d}%)\"\n  },\n  \"legend\": {\n    \"orient\": \"vertical\",\n    \"left\": 10,\n    \"data\": [\"2023/7/11\", \"2023/7/12\", \"2023/7/13\", \"2023/7/14\", \"2023/7/15\", \"2023/7/16\"]\n  },\n  \"series\": [\n    {\n      \"name\": \"用户增长\",\n      \"type\": \"pie\",\n      \"radius\": [\"50%\", \"70%\"],\n      \"avoidLabelOverlap\": false,\n      \"label\": {\n        \"show\": false,\n        \"position\": \"center\"\n      },\n      \"emphasis\": {\n        \"label\": {\n          \"show\": true,\n          \"fontSize\": \"30\",\n          \"fontWeight\": \"bold\"\n        }\n      },\n      \"labelLine\": {\n        \"show\": false\n      },\n      \"data\": [\n        {\"value\": 10, \"name\": \"2023/7/11\"},\n        {\"value\": 20, \"name\": \"2023/7/12\"},\n        {\"value\": 30, \"name\": \"2023/7/13\"},\n        {\"value\": 0, \"name\": \"2023/7/14\"},\n        {\"value\": 40, \"name\": \"2023/7/15\"},\n        {\"value\": 40, \"name\": \"2023/7/16\"}\n      ]\n    }\n  ]\n}', '根据分析结果，可以得出以下结论：\n- 2023/7/13的用户增长最多，达到了30人。\n- 2023/7/14的用户增长为0，没有新增用户。\n- 2023/7/15和2023/7/16的用户增长相同，都是40人。\n- 其他日期的用户增长分别为10人和20人。\n- 可以看出日期对用户增长有一定的影响，有些日期用户增长较多，而有些日期没有新增用户。', 'succeed', NULL, 1697633200786403330, '2023-09-24 15:43:27', '2023-09-24 15:43:42', 0);
INSERT INTO `chart` (`id`, `goal`, `name`, `chartData`, `chartType`, `genChart`, `genResult`, `status`, `execMessage`, `userId`, `createTime`, `updateTime`, `isDelete`) VALUES (1705851189247619074, '分析需求', '分析需求', '日期,用户增长\n2023/7/11,10\n2023/7/12,20\n2023/7/13,30\n2023/7/14,0\n2023/7/15,40\n2023/7/16,40\n', '柱状图', '{\n  \"tooltip\": {\n    \"trigger\": \"axis\",\n    \"axisPointer\": {\n      \"type\": \"shadow\"\n    }\n  },\n  \"grid\": {\n    \"left\": \"3%\",\n    \"right\": \"4%\",\n    \"bottom\": \"3%\",\n    \"containLabel\": true\n  },\n  \"xAxis\": {\n    \"type\": \"category\",\n    \"data\": [\"2023/7/11\", \"2023/7/12\", \"2023/7/13\", \"2023/7/14\", \"2023/7/15\", \"2023/7/16\"]\n  },\n  \"yAxis\": {\n    \"type\": \"value\"\n  },\n  \"series\": [\n    {\n      \"name\": \"用户增长\",\n      \"type\": \"bar\",\n      \"data\": [10, 20, 30, 0, 40, 40]\n    }\n  ]\n}', '根据数据分析，可以得出以下结论：\n1. 用户增长在2023年7月11日和7月12日有较大幅度的增加，在这两天中，用户增长分别为10和20。\n2. 在7月14日，用户增长为0，没有新增用户。\n3. 从7月13日开始，用户增长持续上升，到7月16日达到了最高点，增加了40个用户。\n4. 总体而言，用户增长呈现出波动上升的趋势，在波动中有所下降，但整体仍然保持增长态势。', 'succeed', NULL, 1697633200786403330, '2023-09-24 15:46:31', '2023-09-24 15:46:43', 0);
INSERT INTO `chart` (`id`, `goal`, `name`, `chartData`, `chartType`, `genChart`, `genResult`, `status`, `execMessage`, `userId`, `createTime`, `updateTime`, `isDelete`) VALUES (1705856569168113666, '瞎分析一下', '瞎分析一下', '日期,用户增长\n2023/7/11,10\n2023/7/12,20\n2023/7/13,30\n2023/7/14,0\n2023/7/15,40\n2023/7/16,40\n', '堆叠图', '{\n   \"tooltip\": {},\n   \"xAxis\": {\n      \"type\": \"category\",\n      \"data\": [\"2023/7/11\", \"2023/7/12\", \"2023/7/13\", \"2023/7/14\", \"2023/7/15\", \"2023/7/16\"]\n   },\n   \"yAxis\": {\n      \"type\": \"value\"\n   },\n   \"series\": [{\n      \"type\": \"bar\",\n      \"name\": \"用户增长\",\n      \"stack\": \"总量\",\n      \"data\": [10, 20, 30, 0, 40, 40]\n   }]\n}', '根据数据分析，用户增长数据呈现出较大的波动性，具体分析如下：\n1. 2023/7/11和2023/7/12两天的用户增长较为稳定，分别为10和20；\n2. 2023/7/13用户增长较大，为30；\n3. 2023/7/14用户增长为0，可能出现了一些异常情况，需要进一步调查原因；\n4. 2023/7/15和2023/7/16的用户增长相同，都为40，说明用户数量保持稳定；\n5. 根据数据看，整体用户增长趋势为波动上升，但在2023/7/14出现了突然的下降，需进一步研究分析原因，并采取措施提高用户增长。', 'succeed', NULL, 1697633200786403330, '2023-09-24 16:07:54', '2023-09-24 16:08:07', 0);
INSERT INTO `chart` (`id`, `goal`, `name`, `chartData`, `chartType`, `genChart`, `genResult`, `status`, `execMessage`, `userId`, `createTime`, `updateTime`, `isDelete`) VALUES (1705857482607833090, '瞎分析一下', '瞎分析', '日期,用户增长\n2023/7/11,10\n2023/7/12,20\n2023/7/13,30\n2023/7/14,0\n2023/7/15,40\n2023/7/16,40\n', '饼图', '{\n  \"tooltip\": {\n    \"trigger\": \"item\",\n    \"formatter\": \"{a} <br/>{b}: {c} ({d}%)\"\n  },\n  \"legend\": {\n    \"orient\": \"vertical\",\n    \"left\": \"left\",\n    \"data\": [\"2023/7/11\", \"2023/7/12\", \"2023/7/13\", \"2023/7/14\", \"2023/7/15\", \"2023/7/16\"]\n  },\n  \"series\": [\n    {\n      \"name\": \"用户增长\",\n      \"type\": \"pie\",\n      \"radius\": [\"50%\", \"70%\"],\n      \"avoidLabelOverlap\": false,\n      \"label\": {\n        \"show\": false,\n        \"position\": \"center\"\n      },\n      \"emphasis\": {\n        \"label\": {\n          \"show\": true,\n          \"fontSize\": \"30\",\n          \"fontWeight\": \"bold\"\n        }\n      },\n      \"labelLine\": {\n        \"show\": false\n      },\n      \"data\": [\n        { \"value\": 10, \"name\": \"2023/7/11\" },\n        { \"value\": 20, \"name\": \"2023/7/12\" },\n        { \"value\": 30, \"name\": \"2023/7/13\" },\n        { \"value\": 0, \"name\": \"2023/7/14\" },\n        { \"value\": 40, \"name\": \"2023/7/15\" },\n        { \"value\": 40, \"name\": \"2023/7/16\" }\n      ]\n    }\n  ]\n}', '根据分析，用户增长情况如下：\n- 2023/7/11新增了10个用户\n- 2023/7/12新增了20个用户\n- 2023/7/13新增了30个用户\n- 2023/7/14没有新增用户\n- 2023/7/15新增了40个用户\n- 2023/7/16新增了40个用户', 'succeed', NULL, 1697633200786403330, '2023-09-24 16:11:31', '2023-09-24 16:11:47', 0);
INSERT INTO `chart` (`id`, `goal`, `name`, `chartData`, `chartType`, `genChart`, `genResult`, `status`, `execMessage`, `userId`, `createTime`, `updateTime`, `isDelete`) VALUES (1705858128526454785, '瞎分析', '瞎分析', '日期,用户增长\n2023/7/11,10\n2023/7/12,20\n2023/7/13,30\n2023/7/14,0\n2023/7/15,40\n2023/7/16,40\n', '折线图', '{\n  \"tooltip\": {\n    \"trigger\": \"axis\"\n  },\n  \"xAxis\": {\n    \"type\": \"category\",\n    \"data\": [\"2023/7/11\", \"2023/7/12\", \"2023/7/13\", \"2023/7/14\", \"2023/7/15\", \"2023/7/16\"]\n  },\n  \"yAxis\": {\n    \"type\": \"value\"\n  },\n  \"series\": [\n    {\n      \"name\": \"用户增长\",\n      \"type\": \"line\",\n      \"data\": [10, 20, 30, 0, 40, 40]\n    }\n  ]\n}', '从给定的原始数据可以看出，用户增长数据的变化趋势如下：\n- 2023年7月11日到7月12日，用户增长从10增加到20；\n- 2023年7月12日到7月13日，用户增长从20增加到30；\n- 2023年7月13日到7月14日，用户增长从30减少到0；\n- 2023年7月14日到7月15日，用户增长从0增加到40；\n- 2023年7月15日到7月16日，用户增长保持在40。\n\n根据用户增长数据的变化趋势，可以得出以下结论：\n1. 用户增长在短期内出现较大的波动，需要进一步探究原因；\n2. 在2023年7月13日到7月14日之间，用户增长出现了明显的下降，需要进一步分析原因并采取相应的措施；\n3. 在2023年7月14日到7月15日之间，用户增长出现了较大的增加，可能与某些推广活动有关，可以继续进行类似的活动试验；\n4. 从2023年7月15日起，用户增长趋于稳定，对持续的用户增长可以保持一定的信心。\n】】】】】', 'succeed', NULL, 1697633200786403330, '2023-09-24 16:14:05', '2023-09-24 16:14:21', 0);
INSERT INTO `chart` (`id`, `goal`, `name`, `chartData`, `chartType`, `genChart`, `genResult`, `status`, `execMessage`, `userId`, `createTime`, `updateTime`, `isDelete`) VALUES (1705858566193766401, '瞎分析', '瞎分析', '日期,用户增长\n2023/7/11,10\n2023/7/12,20\n2023/7/13,30\n2023/7/14,0\n2023/7/15,40\n2023/7/16,40\n', '折线图', '{\n  \"title\": {\n    \"text\": \"用户增长曲线\"\n  },\n  \"xAxis\": {\n    \"type\": \"category\",\n    \"data\": [\"2023/7/11\", \"2023/7/12\", \"2023/7/13\", \"2023/7/14\", \"2023/7/15\", \"2023/7/16\"]\n  },\n  \"yAxis\": {\n    \"type\": \"value\"\n  },\n  \"series\": [{\n    \"data\": [10, 20, 30, 0, 40, 40],\n    \"type\": \"line\"\n  }]\n}', '根据提供的数据，用户增长曲线如下图所示：\n- 2023/7/11用户增长为10\n- 2023/7/12用户增长为20\n- 2023/7/13用户增长为30\n- 2023/7/14用户增长为0\n- 2023/7/15用户增长为40\n- 2023/7/16用户增长为40\n<img src=\"data:image/png;base64,xxxxx\" width=\"600px\" height=\"400px\">\n分析结论：\n根据用户增长曲线的走势，可以发现在2023/7/14出现了一次用户增长为0的情况，这个时间点需要进一步调查原因。其他时间点的增长较为稳定，尤其在2023/7/15和2023/7/16连续两天用户增长达到高峰，可能与某项推广活动有关，值得进一步分析和挖掘。', 'succeed', NULL, 1697633200786403330, '2023-09-24 16:15:50', '2023-09-24 16:16:03', 0);
INSERT INTO `chart` (`id`, `goal`, `name`, `chartData`, `chartType`, `genChart`, `genResult`, `status`, `execMessage`, `userId`, `createTime`, `updateTime`, `isDelete`) VALUES (1705879091263614978, '分析需求', '分析需求', '日期,用户增长\n2023/7/11,10\n2023/7/12,20\n2023/7/13,30\n2023/7/14,0\n2023/7/15,40\n2023/7/16,40\n', '堆叠图', '{\n  \"title\": {\n    \"text\": \"用户增长情况\",\n    \"left\": \"center\"\n  },\n  \"tooltip\": {\n    \"trigger\": \"axis\",\n    \"axisPointer\": {\n      \"type\": \"shadow\"\n    },\n    \"formatter\": \"{b}: {c}\"\n  },\n  \"xAxis\": {\n    \"type\": \"category\",\n    \"data\": [\"2023/7/11\", \"2023/7/12\", \"2023/7/13\", \"2023/7/14\", \"2023/7/15\", \"2023/7/16\"],\n    \"axisTick\": {\n      \"alignWithLabel\": true\n    }\n  },\n  \"yAxis\": {\n    \"type\": \"value\",\n    \"name\": \"用户增长\"\n  },\n  \"series\": [\n    {\n      \"name\": \"新增用户\",\n      \"type\": \"bar\",\n      \"data\": [10, 20, 30, 0, 40, 40],\n      \"stack\": \"总量\"\n    }\n  ]\n}', '根据给定的原始数据生成堆叠图，横轴为日期，纵轴为用户增长数量。从图中可以看出，在2023年7月11日至7月15日期间，用户增长持续增加，但在7月14日没有新增用户。随后，用户增长又在7月15日到7月16日重新增长了。', 'succeed', NULL, 1697633200786403330, '2023-09-24 17:37:23', '2023-09-24 17:37:38', 0);
INSERT INTO `chart` (`id`, `goal`, `name`, `chartData`, `chartType`, `genChart`, `genResult`, `status`, `execMessage`, `userId`, `createTime`, `updateTime`, `isDelete`) VALUES (1705879331261689857, '分析需求', '分析需求', '日期,用户增长\n2023/7/11,10\n2023/7/12,20\n2023/7/13,30\n2023/7/14,0\n2023/7/15,40\n2023/7/16,40\n', '雷达图', '{\n\"tooltip\": {},\n\"radar\": {\n  \"indicator\": [\n    {\"name\": \"用户增长\", \"max\": 40}\n  ],\n  \"shape\": \"circle\",\n  \"center\": [\"50%\", \"50%\"],\n  \"radius\": \"60%\"\n},\n\"series\": [{\n  \"type\": \"radar\",\n  \"data\": [{\n    \"value\": [10],\n    \"name\": \"2023/7/11\"\n  }, {\n    \"value\": [20],\n    \"name\": \"2023/7/12\"\n  }, {\n    \"value\": [30],\n    \"name\": \"2023/7/13\"\n  }, {\n    \"value\": [0],\n    \"name\": \"2023/7/14\"\n  }, {\n    \"value\": [40],\n    \"name\": \"2023/7/15\"\n  }, {\n    \"value\": [40],\n    \"name\": \"2023/7/16\"\n  }]\n}]\n}', '从数据分析的结果来看，用户增长不断发展，但在2023/7/14出现了一次停滞。随后，增长又持续到达了顶峰，2023/7/15和2023/7/16的用户增长达到了最高值40。', 'succeed', NULL, 1697633200786403330, '2023-09-24 17:38:20', '2023-09-24 17:38:33', 0);
INSERT INTO `chart` (`id`, `goal`, `name`, `chartData`, `chartType`, `genChart`, `genResult`, `status`, `execMessage`, `userId`, `createTime`, `updateTime`, `isDelete`) VALUES (1706160036722012161, '瞎分析', '瞎分析', '日期,用户增长\n2023/7/11,10\n2023/7/12,20\n2023/7/13,30\n2023/7/14,0\n2023/7/15,40\n2023/7/16,40\n', '折线图', '{\n    \"title\": {\n        \"text\": \"用户增长折线图\"\n    },\n    \"xAxis\": {\n        \"type\": \"category\",\n        \"data\": [\"2023/7/11\", \"2023/7/12\", \"2023/7/13\", \"2023/7/14\", \"2023/7/15\", \"2023/7/16\"]\n    },\n    \"yAxis\": {\n        \"type\": \"value\"\n    },\n    \"series\": [{\n        \"data\": [10, 20, 30, 0, 40, 40],\n        \"type\": \"line\"\n    }]\n}', '根据给定的数据，可以得出以下结论：\n1. 2023年7月11日用户增长为10人，随后持续增长至7月13日达到最高值30人，然后出现短暂的停滞，7月14日用户增长为0人，之后又重新开始增长。\n2. 在整体趋势上可以看出用户数量在逐渐增加的态势，从10人增长到40人。\n3. 需要进一步分析用户增长受到的影响因素，比如推广活动、产品品质等。', 'succeed', NULL, 1697633200786403330, '2023-09-25 12:13:46', '2023-09-25 12:13:57', 0);
INSERT INTO `chart` (`id`, `goal`, `name`, `chartData`, `chartType`, `genChart`, `genResult`, `status`, `execMessage`, `userId`, `createTime`, `updateTime`, `isDelete`) VALUES (1706160699489153026, '瞎分析', '瞎分析', '日期,用户增长\n2023/7/11,10\n2023/7/12,20\n2023/7/13,30\n2023/7/14,0\n2023/7/15,40\n2023/7/16,40\n', '折线图', '{\n  \"title\": {\n    \"text\": \"用户增长趋势\"\n  },\n  \"xAxis\": {\n    \"type\": \"category\",\n    \"data\": [\"2023/7/11\", \"2023/7/12\", \"2023/7/13\", \"2023/7/14\", \"2023/7/15\", \"2023/7/16\"]\n  },\n  \"yAxis\": {\n    \"type\": \"value\"\n  },\n  \"series\": [\n    {\n      \"name\": \"用户增长\",\n      \"type\": \"line\",\n      \"data\": [10, 20, 30, 0, 40, 40]\n    }\n  ]\n}', '根据给定的数据，可以看出2023年7月11日至7月16日期间的用户增长情况。根据折线图的数据，可以得出以下结论：\n1. 用户数在7月11日增长了10个，之后连续3天的增长分别是20、30和0个，接着在7月15日和7月16日继续增长，分别增长了40个。', 'succeed', NULL, 1697633200786403330, '2023-09-25 12:16:24', '2023-09-25 12:16:34', 0);
INSERT INTO `chart` (`id`, `goal`, `name`, `chartData`, `chartType`, `genChart`, `genResult`, `status`, `execMessage`, `userId`, `createTime`, `updateTime`, `isDelete`) VALUES (1706161202189070338, '随机分析', '随机分析', '日期,用户增长\n2023/7/11,10\n2023/7/12,20\n2023/7/13,30\n2023/7/14,0\n2023/7/15,40\n2023/7/16,40\n', '折线图', '{\n  \"xAxis\": {\n    \"type\": \"category\",\n    \"data\": [\"2023/7/11\", \"2023/7/12\", \"2023/7/13\", \"2023/7/14\", \"2023/7/15\", \"2023/7/16\"]\n  },\n  \"yAxis\": {\n    \"type\": \"value\"\n  },\n  \"series\": [{\n    \"data\": [10, 20, 30, 0, 40, 40],\n    \"type\": \"line\"\n  }]\n}', '根据数据分析，从2023年7月11日至2023年7月16日，用户增长曲线呈现较为平稳的趋势。具体数据如下：\n- 2023/7/11：新增用户数为10\n- 2023/7/12：新增用户数为20\n- 2023/7/13：新增用户数为30\n- 2023/7/14：新增用户数为0\n- 2023/7/15：新增用户数为40\n- 2023/7/16：新增用户数为40\n\n根据数据分析结果，可以推断出用户增长在前三天呈现较快的趋势，而后两天则停止了新增用户。', 'succeed', NULL, 1697633200786403330, '2023-09-25 12:18:24', '2023-09-25 12:18:38', 0);
INSERT INTO `chart` (`id`, `goal`, `name`, `chartData`, `chartType`, `genChart`, `genResult`, `status`, `execMessage`, `userId`, `createTime`, `updateTime`, `isDelete`) VALUES (1706162394738765826, '下分析', '下分析', '日期,用户增长\n2023/7/11,10\n2023/7/12,20\n2023/7/13,30\n2023/7/14,0\n2023/7/15,40\n2023/7/16,40\n', '柱状图', '{\n  \"xAxis\": {\n    \"type\": \"category\",\n    \"data\": [\"2023/7/11\", \"2023/7/12\", \"2023/7/13\", \"2023/7/14\", \"2023/7/15\", \"2023/7/16\"]\n  },\n  \"yAxis\": {\n    \"type\": \"value\"\n  },\n  \"series\": [{\n    \"data\": [10, 20, 30, 0, 40, 40],\n    \"type\": \"bar\"\n  }]\n}', '根据分析结果可以得出以下结论：\n1. 在2023年7月11日至2023年7月16日期间，用户增长数量呈现波动变化的趋势。\n2. 在2023年7月11日和2023年7月13日，用户增长数量较为稳定且有所增加。\n3. 在2023年7月14日，用户增长数量为0，可能出现了异常情况。\n4. 在2023年7月15日和2023年7月16日期间，用户增长数量再次有所增加，并保持相对稳定的态势。\n5. 用户增长的变动情况可以反映产品或服务的受欢迎程度和用户的活跃度，可以进一步分析原因并制定相应的策略。', 'succeed', NULL, 1697633200786403330, '2023-09-25 12:23:08', '2023-09-25 12:23:21', 0);
INSERT INTO `chart` (`id`, `goal`, `name`, `chartData`, `chartType`, `genChart`, `genResult`, `status`, `execMessage`, `userId`, `createTime`, `updateTime`, `isDelete`) VALUES (1706166833251946498, '随便分析', '随便分析', '日期,用户增长\n2023/7/11,10\n2023/7/12,20\n2023/7/13,30\n2023/7/14,0\n2023/7/15,40\n2023/7/16,40\n', '柱状图', '{\n  \"title\": {\n    \"text\": \"用户增长情况\"\n  },\n  \"xAxis\": {\n    \"type\": \"category\",\n    \"data\": [\"2023/7/11\", \"2023/7/12\", \"2023/7/13\", \"2023/7/14\", \"2023/7/15\", \"2023/7/16\"]\n  },\n  \"yAxis\": {\n    \"type\": \"value\"\n  },\n  \"series\": [\n    {\n      \"data\": [10, 20, 30, 0, 40, 40],\n      \"type\": \"bar\"\n    }\n  ]\n}', '根据提供的原始数据，可以得出以下结论：\n1. 在2023/7/11-2023/7/13期间，用户增长呈现逐日增加的趋势。\n2. 在2023/7/14日用户增长为0，可能是因为数据缺失或者出现了异常情况。\n3. 从2023/7/15日开始，用户增长再次出现，且持续增长。\n4. 在2023/7/15-2023/7/16期间，用户增长保持稳定，为40。', 'succeed', NULL, 1697633200786403330, '2023-09-25 12:40:46', '2023-09-25 12:40:58', 0);
INSERT INTO `chart` (`id`, `goal`, `name`, `chartData`, `chartType`, `genChart`, `genResult`, `status`, `execMessage`, `userId`, `createTime`, `updateTime`, `isDelete`) VALUES (1706171118689783810, '瞎分析', '瞎分析', '日期,用户增长\n2023/7/11,10\n2023/7/12,20\n2023/7/13,30\n2023/7/14,0\n2023/7/15,40\n2023/7/16,40\n', '折线图', '{\n  \"title\": {\n    \"text\": \"用户增长趋势\",\n    \"left\": \"center\"\n  },\n  \"xAxis\": {\n    \"type\": \"category\",\n    \"data\": [\"2023/7/11\", \"2023/7/12\", \"2023/7/13\", \"2023/7/14\", \"2023/7/15\", \"2023/7/16\"]\n  },\n  \"yAxis\": {\n    \"type\": \"value\",\n    \"name\": \"用户增长\"\n  },\n  \"tooltip\": {\n    \"trigger\": \"axis\"\n  },\n  \"series\": [\n    {\n      \"name\": \"用户增长\",\n      \"type\": \"line\",\n      \"data\": [10, 20, 30, 0, 40, 40]\n    }\n  ]\n}', '根据提供的原始数据，我们可以看到在2023年7月11日到2023年7月16日期间，用户增长趋势如下所示：\n- 2023/7/11：新增了10个用户\n- 2023/7/12：新增了20个用户\n- 2023/7/13：新增了30个用户\n- 2023/7/14：新增了0个用户\n- 2023/7/15：新增了40个用户\n- 2023/7/16：新增了40个用户\n\n根据数据分析，用户增长在最开始的几天有较大的增长，后续趋于稳定，除了2023年7月14日没有新增用户外，其他日期都有新增用户。用户增长的趋势整体上是正向的，但在某些日期上出现了波动。', 'succeed', NULL, 1697633200786403330, '2023-09-25 12:57:48', '2023-09-25 12:58:24', 0);
INSERT INTO `chart` (`id`, `goal`, `name`, `chartData`, `chartType`, `genChart`, `genResult`, `status`, `execMessage`, `userId`, `createTime`, `updateTime`, `isDelete`) VALUES (1706171348625723394, '下分析', '下分析', '日期,用户增长\n2023/7/11,10\n2023/7/12,20\n2023/7/13,30\n2023/7/14,0\n2023/7/15,40\n2023/7/16,40\n', '雷达图', '{\n    \"title\": {\n        \"text\": \"用户增长趋势\"\n    },\n    \"tooltip\": {},\n    \"radar\": [{\n        \"indicator\": [\n            { \"name\": \"2023/7/11\" },\n            { \"name\": \"2023/7/12\" },\n            { \"name\": \"2023/7/13\" },\n            { \"name\": \"2023/7/14\" },\n            { \"name\": \"2023/7/15\" },\n            { \"name\": \"2023/7/16\" }\n        ],\n        \"shape\": \"polygon\",\n        \"splitNumber\": 5,\n        \"splitArea\": {\n            \"show\": false\n        },\n        \"axisLabel\": {\n            \"show\": false\n        },\n        \"splitLine\": {\n            \"lineStyle\": {\n                \"color\": \"#999\"\n            }\n        },\n        \"indicator\": [\n            { \"name\": \"用户增长\" }\n        ]\n    }],\n    \"series\": [{\n        \"name\": \"用户增长\",\n        \"type\": \"radar\",\n        \"data\": [{\n            \"value\": [10, 20, 30, 0, 40, 40],\n            \"name\": \"用户增长\"\n        }]\n    }]\n}', '根据提供的数据，可以看出以下结论：\n1. 2023年7月11日的用户增长为10人\n2. 2023年7月12日的用户增长为20人\n3. 2023年7月13日的用户增长为30人\n4. 2023年7月14日的用户增长为0人\n5. 2023年7月15日的用户增长为40人\n6. 2023年7月16日的用户增长为40人', 'succeed', NULL, 1697633200786403330, '2023-09-25 12:58:43', '2023-09-25 12:59:01', 0);
INSERT INTO `chart` (`id`, `goal`, `name`, `chartData`, `chartType`, `genChart`, `genResult`, `status`, `execMessage`, `userId`, `createTime`, `updateTime`, `isDelete`) VALUES (1706173010874535938, '下分析', '下分析', '日期,用户增长\n2023/7/11,10\n2023/7/12,20\n2023/7/13,30\n2023/7/14,0\n2023/7/15,40\n2023/7/16,40\n', '折线图', '{\n  \"title\": {\n    \"text\": \"用户增长趋势\",\n    \"x\": \"center\"\n  },\n  \"xAxis\": {\n    \"type\": \"category\",\n    \"data\": [\"2023/7/11\", \"2023/7/12\", \"2023/7/13\", \"2023/7/14\", \"2023/7/15\", \"2023/7/16\"]\n  },\n  \"yAxis\": {\n    \"type\": \"value\"\n  },\n  \"series\": [{\n    \"data\": [10, 20, 30, 0, 40, 40],\n    \"type\": \"line\",\n    \"smooth\": true\n  }]\n}', '根据数据分析，用户增长趋势如下：\n- 2023年7月14日用户增长为0，可能出现了问题导致用户增长停滞，需要进一步调查问题原因。\n- 在2023年7月13日之前，用户增长呈现逐步增加的趋势，可以认为吸引了更多的用户使用产品。\n- 2023年7月15日和7月16日用户增长继续保持在较高水平，可以认为产品受到了用户的欢迎，需要进一步加强用户的黏性和留存。', 'succeed', NULL, 1697633200786403330, '2023-09-25 13:05:19', '2023-09-25 13:05:43', 0);
INSERT INTO `chart` (`id`, `goal`, `name`, `chartData`, `chartType`, `genChart`, `genResult`, `status`, `execMessage`, `userId`, `createTime`, `updateTime`, `isDelete`) VALUES (1706174281467629570, '随便分析', '随便分析', '日期,用户增长\n2023/7/11,10\n2023/7/12,20\n2023/7/13,30\n2023/7/14,0\n2023/7/15,40\n2023/7/16,40\n', '柱状图', '{\n  \"title\": {\n    \"text\": \"用户增长情况\",\n    \"x\": \"center\"\n  },\n  \"xAxis\": {\n    \"type\": \"category\",\n    \"data\": [\"2023/7/11\", \"2023/7/12\", \"2023/7/13\", \"2023/7/14\", \"2023/7/15\", \"2023/7/16\"]\n  },\n  \"yAxis\": {\n    \"type\": \"value\"\n  },\n  \"series\": [\n    {\n      \"name\": \"用户增长\",\n      \"type\": \"bar\",\n      \"data\": [10, 20, 30, 0, 40, 40]\n    }\n  ]\n}', '根据数据分析可得：\n1. 在2023/7/11，用户增长为10；\n2. 在2023/7/12，用户增长为20；\n3. 在2023/7/13，用户增长为30；\n4. 在2023/7/14，用户增长为0；\n5. 在2023/7/15，用户增长为40；\n6. 在2023/7/16，用户增长为40。', 'succeed', NULL, 1697633200786403330, '2023-09-25 13:10:22', '2023-09-25 13:10:35', 0);
INSERT INTO `chart` (`id`, `goal`, `name`, `chartData`, `chartType`, `genChart`, `genResult`, `status`, `execMessage`, `userId`, `createTime`, `updateTime`, `isDelete`) VALUES (1706174558203613185, '随便分析', '随便分析', '日期,用户增长\n2023/7/11,10\n2023/7/12,20\n2023/7/13,30\n2023/7/14,0\n2023/7/15,40\n2023/7/16,40\n', '柱状图', '{\n  \"title\": {\n    \"text\": \"用户增长情况\"\n  },\n  \"xAxis\": {\n    \"type\": \"category\",\n    \"data\": [\"2023/7/11\", \"2023/7/12\", \"2023/7/13\", \"2023/7/14\", \"2023/7/15\", \"2023/7/16\"]\n  },\n  \"yAxis\": {\n    \"type\": \"value\"\n  },\n  \"series\": [\n    {\n      \"type\": \"bar\",\n      \"data\": [10, 20, 30, 0, 40, 40]\n    }\n  ]\n}', '根据提供的原始数据，我们可以得出以下结论：\n1. 在2023年7月11日至2023年7月16日期间，用户增长量逐日增加。\n2. 在2023年7月14日当天出现用户增长停滞，没有任何新增用户。\n3. 在2023年7月15日至2023年7月16日期间，用户增长量保持稳定，每天新增40名用户。', 'succeed', NULL, 1697633200786403330, '2023-09-25 13:11:28', '2023-09-25 13:11:40', 0);
INSERT INTO `chart` (`id`, `goal`, `name`, `chartData`, `chartType`, `genChart`, `genResult`, `status`, `execMessage`, `userId`, `createTime`, `updateTime`, `isDelete`) VALUES (1706563629606354945, '随便分析', '随机分析', '日期,用户增长\n2023/7/11,10\n2023/7/12,20\n2023/7/13,30\n2023/7/14,0\n2023/7/15,40\n2023/7/16,40\n', '饼图', '{\n  \"title\": {\n    \"text\": \"用户增长情况\",\n    \"left\": \"center\"\n  },\n  \"tooltip\": {\n    \"trigger\": \"item\",\n    \"formatter\": \"{a} <br/>{b} : {c} ({d}%)\"\n  },\n  \"legend\": {\n    \"orient\": \"vertical\",\n    \"left\": \"left\",\n    \"data\": [\"2023/7/11\", \"2023/7/12\", \"2023/7/13\", \"2023/7/14\", \"2023/7/15\", \"2023/7/16\"]\n  },\n  \"series\": [\n    {\n      \"name\": \"用户增长\",\n      \"type\": \"pie\",\n      \"radius\": \"55%\",\n      \"center\": [\"50%\", \"60%\"],\n      \"data\": [\n        {\"value\": 10, \"name\": \"2023/7/11\"},\n        {\"value\": 20, \"name\": \"2023/7/12\"},\n        {\"value\": 30, \"name\": \"2023/7/13\"},\n        {\"value\": 0, \"name\": \"2023/7/14\"},\n        {\"value\": 40, \"name\": \"2023/7/15\"},\n        {\"value\": 40, \"name\": \"2023/7/16\"}\n      ],\n      \"emphasis\": {\n        \"itemStyle\": {\n          \"shadowBlur\": 10,\n          \"shadowOffsetX\": 0,\n          \"shadowColor\": \"rgba(0, 0, 0, 0.5)\"\n        }\n      }\n    }\n  ]\n}', '根据数据分析结果，用户增长情况如下：\n- 2023/7/11新增10个用户\n- 2023/7/12新增20个用户\n- 2023/7/13新增30个用户\n- 2023/7/14无新增用户\n- 2023/7/15新增40个用户\n- 2023/7/16新增40个用户', 'succeed', NULL, 1697633200786403330, '2023-09-26 14:57:30', '2023-09-26 14:57:50', 0);
INSERT INTO `chart` (`id`, `goal`, `name`, `chartData`, `chartType`, `genChart`, `genResult`, `status`, `execMessage`, `userId`, `createTime`, `updateTime`, `isDelete`) VALUES (1706564015125807105, '预测一下未来的用户增长', '用户分析', '日期,用户增长\n2023/7/11,10\n2023/7/12,20\n2023/7/13,30\n2023/7/14,0\n2023/7/15,40\n2023/7/16,40\n', '折线图', '{\n  \"title\": {\n    \"text\": \"未来的用户增长预测\",\n    \"subtext\": \"基于历史数据进行预测\"\n  },\n  \"tooltip\": {\n    \"trigger\": \"axis\"\n  },\n  \"xAxis\": {\n    \"type\": \"category\",\n    \"data\": [\"2023/7/11\", \"2023/7/12\", \"2023/7/13\", \"2023/7/14\", \"2023/7/15\", \"2023/7/16\"]\n  },\n  \"yAxis\": {\n    \"type\": \"value\",\n    \"name\": \"用户增长\"\n  },\n  \"series\": [{\n    \"name\": \"用户增长\",\n    \"type\": \"line\",\n    \"data\": [10, 20, 30, 0, 40, 40]\n  }]\n}', '根据历史数据的分析和预测，未来的用户增长趋势如下：\n\n- 2023年7月11日和7月12日的用户增长呈现较快的增长态势，分别为10和20；\n- 2023年7月13日用户增长达到峰值，为30；\n- 2023年7月14日用户增长为0，可能是因为某个特定因素导致用户数量没有增长；\n- 2023年7月15日和7月16日用户增长又开始回升，分别为40和40。\n\n根据以上趋势分析，预测未来的用户增长将有进一步的增长，但具体的增长幅度需要进一步观察和评估。', 'succeed', NULL, 1697633200786403330, '2023-09-26 14:59:02', '2023-09-26 14:59:21', 0);
INSERT INTO `chart` (`id`, `goal`, `name`, `chartData`, `chartType`, `genChart`, `genResult`, `status`, `execMessage`, `userId`, `createTime`, `updateTime`, `isDelete`) VALUES (1706659982302892033, '随便分析', '随机分析', '日期,用户增长\n2023/7/11,10\n2023/7/12,20\n2023/7/13,30\n2023/7/14,0\n2023/7/15,40\n2023/7/16,40\n', '堆叠图', '{\n  \"tooltip\": {\n    \"trigger\": \"axis\"\n  },\n  \"legend\": {\n    \"data\": [\"用户增长\"]\n  },\n  \"xAxis\": {\n    \"type\": \"category\",\n    \"data\": [\"2023/7/11\", \"2023/7/12\", \"2023/7/13\", \"2023/7/14\", \"2023/7/15\", \"2023/7/16\"]\n  },\n  \"yAxis\": {\n    \"type\": \"value\"\n  },\n  \"series\": [\n    {\n      \"name\": \"用户增长\",\n      \"type\": \"bar\",\n      \"stack\": \"总量\",\n      \"data\": [10, 20, 30, 0, 40, 40]\n    }\n  ]\n}', '从数据分析结果可以得出以下结论：\n1. 在2023/7/11，增加了10个用户。\n2. 在2023/7/12，增加了20个用户。\n3. 在2023/7/13，增加了30个用户。\n4. 在2023/7/14，没有增加用户。\n5. 在2023/7/15，增加了40个用户。\n6. 在2023/7/16，增加了40个用户。\n总体来看，用户增长量呈现一定的波动，但整体趋势逐渐上升。', 'succeed', NULL, 1697633200786403330, '2023-09-26 21:20:22', '2023-09-26 21:20:37', 0);
INSERT INTO `chart` (`id`, `goal`, `name`, `chartData`, `chartType`, `genChart`, `genResult`, `status`, `execMessage`, `userId`, `createTime`, `updateTime`, `isDelete`) VALUES (1706660321538199553, '随机分析', '随机分析', '日期,用户增长\n2023/7/11,10\n2023/7/12,20\n2023/7/13,30\n2023/7/14,0\n2023/7/15,40\n2023/7/16,40\n', '堆叠图', '{\n  \"title\": {\n    \"text\": \"用户增长统计\"\n  },\n  \"tooltip\": {\n    \"trigger\": \"axis\",\n    \"axisPointer\": {\n      \"type\": \"shadow\"\n    }\n  },\n  \"legend\": {\n    \"data\": [\"用户增长\"]\n  },\n  \"xAxis\": {\n    \"data\": [\"2023/7/11\", \"2023/7/12\", \"2023/7/13\", \"2023/7/14\", \"2023/7/15\", \"2023/7/16\"]\n  },\n  \"yAxis\": {},\n  \"series\": [\n    {\n      \"name\": \"用户增长\",\n      \"type\": \"bar\",\n      \"stack\": \"总量\",\n      \"data\": [10, 20, 30, 0, 40, 40]\n    }\n  ]\n}', '根据提供的数据，可以得出以下结论：\n1. 用户增长曲线显示了在不同日期的用户增长情况。\n2. 在2023/7/13达到了最高点，为30个用户。\n3. 2023/7/14到达低谷，没有用户增长。\n4. 之后用户增长逐渐恢复，并在2023/7/15和2023/7/16都达到了40个用户。\n5. 综合来看，用户增长整体呈现出稳定增长的趋势，除了2023/7/14的异常情况。', 'succeed', NULL, 1697633200786403330, '2023-09-26 21:21:43', '2023-09-26 21:22:00', 0);
INSERT INTO `chart` (`id`, `goal`, `name`, `chartData`, `chartType`, `genChart`, `genResult`, `status`, `execMessage`, `userId`, `createTime`, `updateTime`, `isDelete`) VALUES (1706663556609040385, '随机分析', '随机分析', '日期,用户增长\n2023/7/11,10\n2023/7/12,20\n2023/7/13,30\n2023/7/14,0\n2023/7/15,40\n2023/7/16,40\n', '饼图', '{\n  \"title\": {\n    \"text\": \"用户增长\",\n    \"subtext\": \"2023年7月11日-2023年7月16日\",\n    \"left\": \"center\"\n  },\n  \"tooltip\": {\n    \"trigger\": \"item\",\n    \"formatter\": \"{a} <br/>{b}: {c} ({d}%)\"\n  },\n  \"legend\": {\n    \"orient\": \"vertical\",\n    \"left\": \"left\",\n    \"data\": [\"2023/7/11\", \"2023/7/12\", \"2023/7/13\", \"2023/7/14\", \"2023/7/15\", \"2023/7/16\"]\n  },\n  \"series\": [\n    {\n      \"name\": \"用户增长\",\n      \"type\": \"pie\",\n      \"radius\": [\"50%\", \"70%\"],\n      \"avoidLabelOverlap\": false,\n      \"label\": {\n        \"show\": false,\n        \"position\": \"center\"\n      },\n      \"emphasis\": {\n        \"label\": {\n          \"show\": true,\n          \"fontSize\": \"30\",\n          \"fontWeight\": \"bold\"\n        }\n      },\n      \"labelLine\": {\n        \"show\": false\n      },\n      \"data\": [\n        {\"value\": 10, \"name\": \"2023/7/11\"},\n        {\"value\": 20, \"name\": \"2023/7/12\"},\n        {\"value\": 30, \"name\": \"2023/7/13\"},\n        {\"value\": 0, \"name\": \"2023/7/14\"},\n        {\"value\": 40, \"name\": \"2023/7/15\"},\n        {\"value\": 40, \"name\": \"2023/7/16\"}\n      ]\n    }\n  ]\n}', '根据饼图的展示，可以得出以下结论：\n1. 2023年7月11日-2023年7月16日期间，用户增长情况如下：\n   - 2023/7/11: 10\n   - 2023/7/12: 20\n   - 2023/7/13: 30\n   - 2023/7/14: 0\n   - 2023/7/15: 40\n   - 2023/7/16: 40\n2. 查看饼图可以清晰地了解每天的用户增长情况，并从中发现用户增长的趋势。\n3. 通过对比不同日期的用户增长，可以识别出哪些日期用户增长较多，哪些日期用户增长较少或者没有增长。\n4. 饼图的数据标签可以显示具体的用户增长数值，方便直观地比较不同日期的增长情况。\n5. 饼图强调了用户增长数值较大的日期，使得这些日期更加突出，方便用户在一瞥之间就能获取关键信息。\n\n综上所述，饼图是一种简洁、直观的方式来呈现用户增长情况，并能够帮助我们做出数据分析和决策。', 'succeed', NULL, 1697633200786403330, '2023-09-26 21:34:34', '2023-09-26 21:35:10', 0);
INSERT INTO `chart` (`id`, `goal`, `name`, `chartData`, `chartType`, `genChart`, `genResult`, `status`, `execMessage`, `userId`, `createTime`, `updateTime`, `isDelete`) VALUES (1707739629790818306, '分析网站的用户情况', '用户增长', '日期,用户增长\n2023/7/11,10\n2023/7/12,20\n2023/7/13,30\n2023/7/14,0\n2023/7/15,40\n2023/7/16,40\n', '折线图', '{\n  \"title\": {\n    \"text\": \"网站用户增长情况\",\n    \"subtext\": \"数据来源：2023年7月11日-2023年7月16日\",\n    \"x\": \"center\"\n  },\n  \"xAxis\": {\n    \"type\": \"category\",\n    \"data\": [\"2023/7/11\", \"2023/7/12\", \"2023/7/13\", \"2023/7/14\", \"2023/7/15\", \"2023/7/16\"]\n  },\n  \"yAxis\": {\n    \"type\": \"value\",\n    \"name\": \"用户数量\"\n  },\n  \"tooltip\": {\n    \"trigger\": \"axis\",\n    \"axisPointer\": {\n      \"type\": \"cross\",\n      \"crossStyle\": {\n        \"color\": \"#999\"\n      }\n    }\n  },\n  \"series\": [\n    {\n      \"name\": \"用户增长\",\n      \"type\": \"line\",\n      \"data\": [10, 20, 30, 0, 40, 40],\n      \"smooth\": true\n    }\n  ]\n}', '根据提供的数据，可以得出以下数据分析结论：\n1. 网站的用户增长情况呈现出波动上升的趋势。\n2. 在2023年7月11日至2023年7月16日的期间，用户增长从10人逐渐上升到40人，并在其中出现了一天的用户数量为0的异常情况。\n3. 随着时间的推移，用户数量的增长不是持续的，可能受到其他因素的影响。\n4. 根据折线图的趋势，可以进行进一步的数据分析和业务决策。', 'succeed', NULL, 1697633200786403330, '2023-09-29 20:50:30', '2023-09-29 20:50:50', 0);
INSERT INTO `chart` (`id`, `goal`, `name`, `chartData`, `chartType`, `genChart`, `genResult`, `status`, `execMessage`, `userId`, `createTime`, `updateTime`, `isDelete`) VALUES (1710630346942877697, '分析需求', '分析需求', '日期,用户增长\n2023/7/11,10\n2023/7/12,20\n2023/7/13,30\n2023/7/14,0\n2023/7/15,40\n2023/7/16,40\n', '柱状图', '{\n  \"title\": {\n    \"text\": \"用户增长情况\",\n    \"subtext\": \"2023年7月11日至2023年7月16日\",\n    \"left\": \"center\"\n  },\n  \"xAxis\": {\n    \"type\": \"category\",\n    \"data\": [\"2023/7/11\", \"2023/7/12\", \"2023/7/13\", \"2023/7/14\", \"2023/7/15\", \"2023/7/16\"]\n  },\n  \"yAxis\": {\n    \"type\": \"value\"\n  },\n  \"series\": [{\n    \"data\": [10,20,30,0,40,40],\n    \"type\": \"bar\"\n  }]\n}', '根据分析结果，用户在2023年7月11日至2023年7月16日期间的增长情况如下：\n- 2023/7/11日新增用户数量为10\n- 2023/7/12日新增用户数量为20\n- 2023/7/13日新增用户数量为30\n- 2023/7/14日新增用户数量为0\n- 2023/7/15日新增用户数量为40\n- 2023/7/16日新增用户数量为40\n\n可以观察到，用户增长在7月11日至7月13日逐日增加，之后保持稳定。而在7月14日新增用户数量为0，可能由于系统维护或其他原因导致用户增长停滞。在之后的两天，新增用户数量又恢复到了较高的水平。', 'succeed', NULL, 1697633200786403330, '2023-10-07 20:17:11', '2023-10-07 20:18:22', 0);
INSERT INTO `chart` (`id`, `goal`, `name`, `chartData`, `chartType`, `genChart`, `genResult`, `status`, `execMessage`, `userId`, `createTime`, `updateTime`, `isDelete`) VALUES (1711355882224754690, '用户增长情况', '用户增长情况', '日期,用户增长\n2023/7/11,10\n2023/7/12,20\n2023/7/13,30\n2023/7/14,0\n2023/7/15,40\n2023/7/16,40\n', '折线图', '{\n  \"title\": {\n    \"text\": \"用户增长情况\",\n    \"x\": \"center\"\n  },\n  \"xAxis\": {\n    \"type\": \"category\",\n    \"data\": [\"2023/7/11\", \"2023/7/12\", \"2023/7/13\", \"2023/7/14\", \"2023/7/15\", \"2023/7/16\"]\n  },\n  \"yAxis\": {\n    \"type\": \"value\"\n  },\n  \"series\": [{\n    \"data\": [10, 20, 30, 0, 40, 40],\n    \"type\": \"line\"\n  }]\n}', '根据数据分析，用户增长情况如下：\n- 2023/7/11当天新增10个用户\n- 2023/7/12当天新增20个用户\n- 2023/7/13当天新增30个用户\n- 2023/7/14当天新增0个用户\n- 2023/7/15当天新增40个用户\n- 2023/7/16当天新增40个用户\n\n可以看出，用户增长呈现先增长后稳定的趋势，且在2023/7/14当天出现了停滞的情况，需要分析具体原因并采取相应措施。', 'succeed', NULL, 1711350501649948674, '2023-10-09 20:20:12', '2023-10-09 20:21:01', 0);


create table if not exists bi.chat
(
    id         bigint                             not null
        primary key,
    userId     bigint                             not null comment '用户id',
    modelId    bigint                             not null comment '助手id',
    createTime datetime default CURRENT_TIMESTAMP null,
    updateTime datetime default CURRENT_TIMESTAMP null,
    isDelete   tinyint  default 0                 null
);

INSERT INTO `chat` (`id`, `userId`, `modelId`, `createTime`, `updateTime`, `isDelete`) VALUES (1709286080106831873, 1697633200786403330, 1707645538323144706, '2023-10-04 03:15:33', '2023-10-04 03:15:33', 0);
INSERT INTO `chat` (`id`, `userId`, `modelId`, `createTime`, `updateTime`, `isDelete`) VALUES (1709289331954917377, 1697633200786403330, 1706980023632138241, '2023-10-04 03:28:28', '2023-10-04 03:28:28', 0);
INSERT INTO `chat` (`id`, `userId`, `modelId`, `createTime`, `updateTime`, `isDelete`) VALUES (1710206853990445058, 1697633200786403330, 1710206785442934785, '2023-10-06 16:14:22', '2023-10-06 16:14:22', 0);
INSERT INTO `chat` (`id`, `userId`, `modelId`, `createTime`, `updateTime`, `isDelete`) VALUES (1710868351234424833, 1697633200786403330, 1710640314391814145, '2023-10-08 12:02:55', '2023-10-08 12:02:55', 0);
INSERT INTO `chat` (`id`, `userId`, `modelId`, `createTime`, `updateTime`, `isDelete`) VALUES (1711224945994383361, 1705187795989446657, 1707645538323144706, '2023-10-09 11:39:54', '2023-10-09 11:39:54', 0);
INSERT INTO `chat` (`id`, `userId`, `modelId`, `createTime`, `updateTime`, `isDelete`) VALUES (1711226573476667393, 1711226458418520066, 1710206785442934785, '2023-10-09 11:46:22', '2023-10-09 11:46:22', 0);
INSERT INTO `chat` (`id`, `userId`, `modelId`, `createTime`, `updateTime`, `isDelete`) VALUES (1711227593044860930, 1711226458418520066, 1711227464141316098, '2023-10-09 11:50:25', '2023-10-09 11:50:25', 0);
INSERT INTO `chat` (`id`, `userId`, `modelId`, `createTime`, `updateTime`, `isDelete`) VALUES (1711351823178670082, 1711350501649948674, 1710206785442934785, '2023-10-09 20:04:04', '2023-10-09 20:04:04', 0);
INSERT INTO `chat` (`id`, `userId`, `modelId`, `createTime`, `updateTime`, `isDelete`) VALUES (1716293012059426817, 1711226458418520066, 1716292966333124609, '2023-10-23 11:18:35', '2023-10-23 11:18:35', 0);
INSERT INTO `chat` (`id`, `userId`, `modelId`, `createTime`, `updateTime`, `isDelete`) VALUES (1716450615708217345, 1697633200786403330, 1706980023632138241, '2023-10-23 21:44:51', '2023-10-23 21:44:51', 0);


create table if not exists bi.chat_history
(
    id          bigint                             not null
        primary key,
    chatRole    tinyint  default 0                 not null comment '0-用户 1-AI',
    chatId      bigint                             not null comment '会话id',
    modelId     bigint                             not null comment '助手id',
    content     varchar(2048)                      null comment '回应内容',
    execMessage varchar(255)                       null comment '特定信息',
    status      tinyint  default 0                 null comment '消息状态  0-正常 1-异常',
    createTime  datetime default CURRENT_TIMESTAMP null,
    updateTime  datetime default CURRENT_TIMESTAMP null,
    isDelete    tinyint  default 0                 null
);
INSERT INTO `chat_history` (`id`, `chatRole`, `chatId`, `modelId`, `content`, `execMessage`, `status`, `createTime`, `updateTime`, `isDelete`) VALUES (1709286080106831999, 0, 1709286080106831873, 1707645538323144706, '你好', NULL, 0, '2023-10-04 16:06:38', '2023-10-04 16:06:38', 0);
INSERT INTO `chat_history` (`id`, `chatRole`, `chatId`, `modelId`, `content`, `execMessage`, `status`, `createTime`, `updateTime`, `isDelete`) VALUES (1709286080106832000, 1, 1709286080106831873, 1707645538323144706, '你好，有什么我可以帮助你的吗？', NULL, 0, '2023-10-04 16:08:04', '2023-10-04 16:08:04', 0);
INSERT INTO `chat_history` (`id`, `chatRole`, `chatId`, `modelId`, `content`, `execMessage`, `status`, `createTime`, `updateTime`, `isDelete`) VALUES (1709515250908794882, 0, 1709286080106831873, 1707645538323144706, '你好', NULL, 0, '2023-10-04 18:26:11', '2023-10-04 18:26:11', 0);
INSERT INTO `chat_history` (`id`, `chatRole`, `chatId`, `modelId`, `content`, `execMessage`, `status`, `createTime`, `updateTime`, `isDelete`) VALUES (1709515261793013761, 1, 1709286080106831873, 1707645538323144706, '你好！很高兴能为你提供关于学习编程的建议。首先，我需要了解你感兴趣的编程语言和领域，以便为你提供更具体的建议。请告诉我你想了解哪种编程语言或技术领域，例如Python、Java、前端开发等。', '', 0, '2023-10-04 18:26:14', '2023-10-04 18:26:14', 0);
INSERT INTO `chat_history` (`id`, `chatRole`, `chatId`, `modelId`, `content`, `execMessage`, `status`, `createTime`, `updateTime`, `isDelete`) VALUES (1709515680904646658, 0, 1709286080106831873, 1707645538323144706, '你好吗', NULL, 0, '2023-10-04 18:27:54', '2023-10-04 18:27:54', 0);
INSERT INTO `chat_history` (`id`, `chatRole`, `chatId`, `modelId`, `content`, `execMessage`, `status`, `createTime`, `updateTime`, `isDelete`) VALUES (1709515686801838081, 1, 1709286080106831873, 1707645538323144706, '你好！我很好，谢谢你的关心。请问有什么关于编程方面的问题需要我帮助解答吗？', '', 0, '2023-10-04 18:27:55', '2023-10-04 18:27:55', 0);
INSERT INTO `chat_history` (`id`, `chatRole`, `chatId`, `modelId`, `content`, `execMessage`, `status`, `createTime`, `updateTime`, `isDelete`) VALUES (1709515709203615746, 0, 1709286080106831873, 1707645538323144706, '你好吗', NULL, 0, '2023-10-04 18:28:00', '2023-10-04 18:28:00', 0);
INSERT INTO `chat_history` (`id`, `chatRole`, `chatId`, `modelId`, `content`, `execMessage`, `status`, `createTime`, `updateTime`, `isDelete`) VALUES (1709515715427962882, 1, 1709286080106831873, 1707645538323144706, '你好！我很好，谢谢你的关心。请问有什么关于编程方面的问题需要我帮助解答吗？', '', 0, '2023-10-04 18:28:02', '2023-10-04 18:28:02', 0);
INSERT INTO `chat_history` (`id`, `chatRole`, `chatId`, `modelId`, `content`, `execMessage`, `status`, `createTime`, `updateTime`, `isDelete`) VALUES (1709540331684999170, 0, 1709286080106831873, 1707645538323144706, '今天天气如何？', NULL, 0, '2023-10-04 20:05:51', '2023-10-04 20:05:51', 0);
INSERT INTO `chat_history` (`id`, `chatRole`, `chatId`, `modelId`, `content`, `execMessage`, `status`, `createTime`, `updateTime`, `isDelete`) VALUES (1709540354200023042, 1, 1709286080106831873, 1707645538323144706, '今天合肥市的天气是多云，温度适宜，白天最高气温23℃，夜间最低气温18℃。空气质量优，PM2.5指数为29。湿度为79%，西北风微风。总体来说，今天合肥市的天气状况还不错，适宜出行。', '', 0, '2023-10-04 20:05:56', '2023-10-04 20:05:56', 0);
INSERT INTO `chat_history` (`id`, `chatRole`, `chatId`, `modelId`, `content`, `execMessage`, `status`, `createTime`, `updateTime`, `isDelete`) VALUES (1709541363118878721, 0, 1709286080106831873, 1707645538323144706, 'java学习路线', NULL, 0, '2023-10-04 20:09:57', '2023-10-04 20:09:57', 0);
INSERT INTO `chat_history` (`id`, `chatRole`, `chatId`, `modelId`, `content`, `execMessage`, `status`, `createTime`, `updateTime`, `isDelete`) VALUES (1709541392831328258, 1, 1709286080106831873, 1707645538323144706, 'Java 学习路线因人而异，但是一般来说，Java 学习路线可以分为以下几个阶段：Java SE基础、Java Web（含数据库+H5+js+vue）、Maven、Git、SSM框架、MybatisPlus、Spring Boot等  。如果您想更深入地了解 Java，可以了解 Java 底层的虚拟机技术。', '', 0, '2023-10-04 20:10:04', '2023-10-04 20:10:04', 0);
INSERT INTO `chat_history` (`id`, `chatRole`, `chatId`, `modelId`, `content`, `execMessage`, `status`, `createTime`, `updateTime`, `isDelete`) VALUES (1709543636104491010, 0, 1709286080106831873, 1707645538323144706, '冒泡排序', NULL, 0, '2023-10-04 20:18:59', '2023-10-04 20:18:59', 0);
INSERT INTO `chat_history` (`id`, `chatRole`, `chatId`, `modelId`, `content`, `execMessage`, `status`, `createTime`, `updateTime`, `isDelete`) VALUES (1709543671902875650, 1, 1709286080106831873, 1707645538323144706, '冒泡排序是一种简单但效率较低的排序算法，它的基本思想是通过不断交换相邻两个元素的位置来将待排序的元素逐步移动到正确的位置上。以下是一些学习冒泡排序的建议：\n\n  1. 理解冒泡排序的基本原理和思想。了解为什么要进行相邻元素的比较和交换，以及如何通过多次遍历来实现排序。\n\n  2. 掌握冒泡排序的实现代码。可以通过查找相关资料或者参考经典的算法书籍来学习冒泡排序的实现方法。\n\n  3. 练习编写冒泡排序的代码。可以使用在线编程平台或者本地编译器来进行练习和测试。\n\n  4. 尝试优化冒泡排序的效率。虽然冒泡排序的时间复杂度为 O(n^2)，但是可以通过一些技巧来提高效率，如设置标志位来判断是否进行了交换等。\n\n总之，学习冒泡排序需要掌握其基本原理和实现方法，并在实践中不断练习和优化。', '', 0, '2023-10-04 20:19:07', '2023-10-04 20:19:07', 0);
INSERT INTO `chat_history` (`id`, `chatRole`, `chatId`, `modelId`, `content`, `execMessage`, `status`, `createTime`, `updateTime`, `isDelete`) VALUES (1709543740479746049, 0, 1709286080106831873, 1707645538323144706, '你能帮我写一下啊冒泡排序吗', NULL, 0, '2023-10-04 20:19:24', '2023-10-04 20:19:24', 0);
INSERT INTO `chat_history` (`id`, `chatRole`, `chatId`, `modelId`, `content`, `execMessage`, `status`, `createTime`, `updateTime`, `isDelete`) VALUES (1709543773077876738, 1, 1709286080106831873, 1707645538323144706, '当然可以！以下是冒泡排序的 Python 代码实现：\n\n[code]\n\n    python\n    \n    def bubble_sort(arr):\n    n = len(arr)\n    for i in range(n):\n        for j in range(0, n-i-1):\n            if arr[j] > arr[j+1]:\n                arr[j], arr[j+1] = arr[j+1], arr[j]\n    return arr\n\n[/code]\n\n这个函数接受一个列表作为参数，并返回一个排好序的列表。它使用两个嵌套的循环来比较相邻的元素，并在需要时交换它们的位置。外层循环控制遍历的次数，内层循环用于比较和交换元素。在每次遍历结束后，最大的元素都会被移动到列表的末尾。', '', 0, '2023-10-04 20:19:31', '2023-10-04 20:19:31', 0);
INSERT INTO `chat_history` (`id`, `chatRole`, `chatId`, `modelId`, `content`, `execMessage`, `status`, `createTime`, `updateTime`, `isDelete`) VALUES (1709555721408458753, 0, 1709286080106831873, 1707645538323144706, 'mysql', NULL, 0, '2023-10-04 21:07:00', '2023-10-04 21:07:00', 0);
INSERT INTO `chat_history` (`id`, `chatRole`, `chatId`, `modelId`, `content`, `execMessage`, `status`, `createTime`, `updateTime`, `isDelete`) VALUES (1709555729285361666, 1, 1709286080106831873, 1707645538323144706, '请问您有什么关于MySQL的问题吗？', '', 0, '2023-10-04 21:07:02', '2023-10-04 21:07:02', 0);
INSERT INTO `chat_history` (`id`, `chatRole`, `chatId`, `modelId`, `content`, `execMessage`, `status`, `createTime`, `updateTime`, `isDelete`) VALUES (1709555962840985601, 0, 1709286080106831873, 1707645538323144706, 'mysql怎么学习给我300字的建议', NULL, 0, '2023-10-04 21:07:58', '2023-10-04 21:07:58', 0);
INSERT INTO `chat_history` (`id`, `chatRole`, `chatId`, `modelId`, `content`, `execMessage`, `status`, `createTime`, `updateTime`, `isDelete`) VALUES (1709556009464868865, 1, 1709286080106831873, 1707645538323144706, '学习MySQL需要掌握以下几个方面：\n\n  1. 数据库基础概念：了解数据库的基本概念，如关系型数据库、表结构、索引、事务等。\n\n  2. SQL语言：MySQL使用SQL语言进行数据操作，学习SQL语言是学习MySQL的基础。\n\n  3. 数据库管理：学习如何使用MySQL的命令行工具进行数据库的管理和维护，包括备份和恢复、用户权限管理等。\n\n  4. 数据库设计：学习如何设计良好的数据库结构，包括表的设计、索引的优化等。\n\n以下是一些学习建议：\n\n  1. 学习资源：可以通过MySQL官方文档、在线教程、书籍等多种途径学习MySQL。推荐《MySQL必知必会》和《高性能MySQL》。\n\n  2. 实践练习：通过实际的操作来加深对MySQL的理解和应用能力。可以尝试在本地搭建MySQL环境，进行数据的创建、查询、更新等操作。\n\n  3. 参与社区：加入MySQL相关的社区或论坛，与其他开发者交流经验和技巧，获取更多的学习资源和支持。\n\n总之，学习MySQL需要不断地实践和积累经验，同时也需要保持持续的学习态度和好奇心。', '', 0, '2023-10-04 21:08:09', '2023-10-04 21:08:09', 0);
INSERT INTO `chat_history` (`id`, `chatRole`, `chatId`, `modelId`, `content`, `execMessage`, `status`, `createTime`, `updateTime`, `isDelete`) VALUES (1709556582822031362, 0, 1709286080106831873, 1707645538323144706, '怎么学习docker给我300字的建议', NULL, 0, '2023-10-04 21:10:26', '2023-10-04 21:10:26', 0);
INSERT INTO `chat_history` (`id`, `chatRole`, `chatId`, `modelId`, `content`, `execMessage`, `status`, `createTime`, `updateTime`, `isDelete`) VALUES (1709556622789554178, 1, 1709286080106831873, 1707645538323144706, '学习Docker需要掌握以下几个方面：\n\n  1. 基础知识：了解Linux操作系统的基本概念和命令，以及Docker容器的原理和基本概念。\n\n  2. Docker命令行工具：掌握Docker的命令行工具，如docker run、docker ps、docker images等，学会使用这些工具来创建和管理容器。\n\n  3. Dockerfile编写：学习如何编写Dockerfile文件，掌握Dockerfile中的指令和语法，以便能够自定义自己的镜像。\n\n以下是一些学习建议：\n\n  1. 学习资源：可以通过Docker官方文档、在线教程、书籍等多种途径学习Docker。推荐《Docker入门与实践》和《Docker深入剖析》。\n\n  2. 实践练习：通过实际的操作来加深对Docker的理解和应用能力。可以尝试在本地搭建Docker环境，创建和管理自己的镜像。\n\n  3. 参与社区：加入Docker相关的社区或论坛，与其他开发者交流经验和技巧，获取更多的学习资源和支持。\n\n总之，学习Docker需要不断地实践和积累经验，同时也需要保持持续的学习态度和好奇心。', '', 0, '2023-10-04 21:10:35', '2023-10-04 21:10:35', 0);
INSERT INTO `chat_history` (`id`, `chatRole`, `chatId`, `modelId`, `content`, `execMessage`, `status`, `createTime`, `updateTime`, `isDelete`) VALUES (1709774843681566722, 0, 1709289331954917377, 1706980023632138241, '给我点建议吧', NULL, 0, '2023-10-05 11:37:43', '2023-10-05 11:37:43', 0);
INSERT INTO `chat_history` (`id`, `chatRole`, `chatId`, `modelId`, `content`, `execMessage`, `status`, `createTime`, `updateTime`, `isDelete`) VALUES (1709774880138457090, 1, 1709289331954917377, 1706980023632138241, '当你遇到后端问题时，以下是一些建议和解决方案：\n\n1. 首先，仔细阅读错误信息。错误信息通常会提供问题的详细信息，帮助你定位问题所在。\n\n2. 确保你的代码没有语法错误。使用代码编辑器或IDE的语法检查功能可以帮助你发现潜在的错误。\n\n3. 检查变量是否已经初始化。在使用变量之前，确保它们已经被正确赋值。例如，如果你在访问数组元素时遇到空指针异常，请检查数组是否为null。\n\n4. 使用调试工具进行调试。大多数编程语言都提供了调试工具，可以帮助你逐步执行代码并检查变量的值。这有助于你找到问题的根源。\n\n5. 查看文档和示例代码。如果你使用的是第三方库或框架，请查阅官方文档以了解正确的使用方法。同时，查看示例代码也可以帮助你理解如何正确使用这些库或框架。\n\n6. 在社区寻求帮助。如果你无法自己解决问题，可以在相关的技术论坛、博客或社交媒体上提问。在提问时，请尽量提供足够的详细信息，以便他人能够更好地帮助你。\n\n7. 保持学习和更新知识。技术总是在不断发展，因此请确保你了解最新的技术和最佳实践。这将有助于你更快地解决问题并提高编程技能。', '', 0, '2023-10-05 11:37:52', '2023-10-05 11:37:52', 0);
INSERT INTO `chat_history` (`id`, `chatRole`, `chatId`, `modelId`, `content`, `execMessage`, `status`, `createTime`, `updateTime`, `isDelete`) VALUES (1709775733540909058, 0, 1709289331954917377, 1706980023632138241, '<Card style={{ width: \'100%\', marginTop: 16 }} hoverable loading={loading} onClick={() => {                       setCurModel(item)                     }}>                       <Meta                         avatar={<Avatar src={currentUser?.userAvatar} />}                         title={item.assistantName}                         description={item.functionDes}                       />                     </Card>怎么在点击Card后，让Card的背景颜色变为蓝色', NULL, 0, '2023-10-05 11:41:15', '2023-10-05 11:41:15', 0);
INSERT INTO `chat_history` (`id`, `chatRole`, `chatId`, `modelId`, `content`, `execMessage`, `status`, `createTime`, `updateTime`, `isDelete`) VALUES (1709775768185860098, 1, 1709289331954917377, 1706980023632138241, '你可以在`onClick`事件中添加一个样式变化。首先，你需要在组件的state或者props中添加一个`isBlue`的状态，然后在`onClick`事件中切换这个状态。当状态变为`true`时，Card的背景颜色就会变为蓝色。\n\n解析后的代码如下：\n\n```jsx\n<Card style={{ width: \'100%\', marginTop: 16 }} hoverable loading={loading} onClick={() => { setCurModel(item); isBlue = !isBlue; }}>\n    <Meta avatar={<Avatar src={currentUser?.userAvatar} />} title={item.assistantName} description={item.functionDes} />\n</Card>\n```\n\n在这段代码中，`isBlue = !isBlue;`这行代码会在每次点击Card后切换`isBlue`的值。当`isBlue`为`true`时，Card的背景颜色就会变为蓝色。', '', 0, '2023-10-05 11:41:23', '2023-10-05 11:41:23', 0);
INSERT INTO `chat_history` (`id`, `chatRole`, `chatId`, `modelId`, `content`, `execMessage`, `status`, `createTime`, `updateTime`, `isDelete`) VALUES (1709778850202382338, 0, 1709289331954917377, 1706980023632138241, '怎么在点击Card的时候修改里面Meta的字体颜色', NULL, 0, '2023-10-05 11:53:38', '2023-10-05 11:53:38', 0);
INSERT INTO `chat_history` (`id`, `chatRole`, `chatId`, `modelId`, `content`, `execMessage`, `status`, `createTime`, `updateTime`, `isDelete`) VALUES (1709778884239159297, 1, 1709289331954917377, 1706980023632138241, '你可以在`onClick`事件中添加一个样式变化，通过改变Meta的`style`属性来修改字体颜色。\n\n解析后的代码如下：\n\n```jsx\n<Card style={{ width: \'100%\', marginTop: 16 }} hoverable loading={loading} onClick={() => { setCurModel(item); isBlue = !isBlue; }}>\n    <Meta avatar={<Avatar src={currentUser?.userAvatar} />} title={item.assistantName} description={item.functionDes} style={{color: isBlue ? \'blue\' : \'black\'}} />\n</Card>\n```\n\n在这段代码中，`style={{color: isBlue ? \'blue\' : \'black\'}}`这行代码会在每次点击Card后切换字体颜色。当`isBlue`为`true`时，字体颜色会变为蓝色，否则为黑色。', '', 0, '2023-10-05 11:53:46', '2023-10-05 11:53:46', 0);
INSERT INTO `chat_history` (`id`, `chatRole`, `chatId`, `modelId`, `content`, `execMessage`, `status`, `createTime`, `updateTime`, `isDelete`) VALUES (1709781684645916673, 0, 1709289331954917377, 1706980023632138241, '可是title和description的颜色都没变', NULL, 0, '2023-10-05 12:04:54', '2023-10-05 12:04:54', 0);
INSERT INTO `chat_history` (`id`, `chatRole`, `chatId`, `modelId`, `content`, `execMessage`, `status`, `createTime`, `updateTime`, `isDelete`) VALUES (1709781723820716034, 1, 1709289331954917377, 1706980023632138241, '如果你想要改变Card内Meta的title和description的颜色，你需要在`style`属性中添加相应的CSS样式。\n\n解析后的代码如下：\n\n```jsx\n<Card style={{ width: \'100%\', marginTop: 16 }} hoverable loading={loading} onClick={() => { setCurModel(item); isBlue = !isBlue; }}>\n    <Meta avatar={<Avatar src={currentUser?.userAvatar} />} title={item.assistantName} description={item.functionDes} style={{color: isBlue ? \'blue\' : \'black\', fontSize: \'20px\', fontWeight: \'bold\'}} />\n</Card>\n```\n\n在这段代码中，`style={{color: isBlue ? \'blue\' : \'black\', fontSize: \'20px\', fontWeight: \'bold\'}}`这行代码会在每次点击Card后切换字体颜色，并将字体大小设置为20px，字体粗细设置为bold。你可以根据需要调整这些样式。', '', 0, '2023-10-05 12:05:03', '2023-10-05 12:05:03', 0);
INSERT INTO `chat_history` (`id`, `chatRole`, `chatId`, `modelId`, `content`, `execMessage`, `status`, `createTime`, `updateTime`, `isDelete`) VALUES (1709781796956794882, 0, 1709289331954917377, 1706980023632138241, '没有作用', NULL, 0, '2023-10-05 12:05:21', '2023-10-05 12:05:21', 0);
INSERT INTO `chat_history` (`id`, `chatRole`, `chatId`, `modelId`, `content`, `execMessage`, `status`, `createTime`, `updateTime`, `isDelete`) VALUES (1709781824576286721, 1, 1709289331954917377, 1706980023632138241, '如果你的代码没有按照预期工作，可能有以下几种原因：\n\n1. 你可能没有正确地设置`isBlue`的值。请确保在每次点击Card后，`isBlue`的值都会被切换。\n\n2. 你可能没有正确地引用Meta组件。请确保你的代码中包含了正确的引用路径。\n\n3. 你可能没有正确地应用CSS样式。请确保你的CSS样式已经被正确地添加到你的项目中，并且没有被其他样式覆盖。\n\n4. 你可能在Card组件的props或state中没有正确地设置相关的属性。请检查你的Card组件的props和state，确保它们被正确地设置和更新。\n\n如果以上都无法解决你的问题，你可以尝试在浏览器的开发者工具中查看错误信息，或者使用debugger语句来调试你的代码。', '', 0, '2023-10-05 12:05:27', '2023-10-05 12:05:27', 0);
INSERT INTO `chat_history` (`id`, `chatRole`, `chatId`, `modelId`, `content`, `execMessage`, `status`, `createTime`, `updateTime`, `isDelete`) VALUES (1709784791945703425, 0, 1709286080106831873, 1707645538323144706, '修改antd meta的title和description字体颜色为#fffff', NULL, 0, '2023-10-05 12:17:15', '2023-10-05 12:17:15', 0);
INSERT INTO `chat_history` (`id`, `chatRole`, `chatId`, `modelId`, `content`, `execMessage`, `status`, `createTime`, `updateTime`, `isDelete`) VALUES (1709784811247890434, 1, 1709286080106831873, 1707645538323144706, '要修改Ant Design的Meta组件的title和description字体颜色为白色，你可以使用CSS样式。在你的CSS文件中添加以下代码：\n\n```css\n.ant-meta-title, .ant-meta-description {\n  color: #ffffff;\n}\n```\n\n这段代码会将antd meta的title和description的字体颜色设置为白色。请确保你的CSS文件已经被正确地导入到你的项目中。', '', 0, '2023-10-05 12:17:19', '2023-10-05 12:17:19', 0);
INSERT INTO `chat_history` (`id`, `chatRole`, `chatId`, `modelId`, `content`, `execMessage`, `status`, `createTime`, `updateTime`, `isDelete`) VALUES (1709785225276026881, 0, 1709289331954917377, 1706980023632138241, 'Card.Meta 参数	说明	类型	默认值	版本 avatar	头像/图标	ReactNode	-	 className	容器类名	string	-	 description	描述内容	ReactNode	-	 style	定义容器类名的样式	CSSProperties	-	 title	标题内容	ReactNode	-	', NULL, 0, '2023-10-05 12:18:58', '2023-10-05 12:18:58', 0);
INSERT INTO `chat_history` (`id`, `chatRole`, `chatId`, `modelId`, `content`, `execMessage`, `status`, `createTime`, `updateTime`, `isDelete`) VALUES (1709785259019202562, 1, 1709289331954917377, 1706980023632138241, 'Card.Meta 参数说明如下：\n\n- avatar: 头像/图标，类型为 ReactNode，默认值为 -。\n- className: 容器类名，类型为 string，默认值为 -。\n- description: 描述内容，类型为 ReactNode，默认值为 -。\n- style: 定义容器类名的样式，类型为 CSSProperties，默认值为 -。\n- title: 标题内容，类型为 ReactNode，默认值为 -。\n\n如果你想要修改 Card.Meta 中的 title 和 description 字体颜色为白色，你可以在 CSS 文件中添加以下代码：\n\n```css\n.ant-card-meta-title, .ant-card-meta-description {\n  color: #ffffff;\n}\n```\n\n这段代码会将 Card.Meta 中的 title 和 description 的字体颜色设置为白色。请确保你的 CSS 文件已经被正确地导入到你的项目中。', '', 0, '2023-10-05 12:19:06', '2023-10-05 12:19:06', 0);
INSERT INTO `chat_history` (`id`, `chatRole`, `chatId`, `modelId`, `content`, `execMessage`, `status`, `createTime`, `updateTime`, `isDelete`) VALUES (1709805507097260034, 0, 1709286080106831873, 1707645538323144706, '今天是几月几日', NULL, 0, '2023-10-05 13:39:34', '2023-10-05 13:39:34', 0);
INSERT INTO `chat_history` (`id`, `chatRole`, `chatId`, `modelId`, `content`, `execMessage`, `status`, `createTime`, `updateTime`, `isDelete`) VALUES (1709805521647300610, 1, 1709286080106831873, 1707645538323144706, '今天是2023年10月5号。', '', 0, '2023-10-05 13:39:37', '2023-10-05 13:39:37', 0);
INSERT INTO `chat_history` (`id`, `chatRole`, `chatId`, `modelId`, `content`, `execMessage`, `status`, `createTime`, `updateTime`, `isDelete`) VALUES (1710210557074337794, 0, 1710206853990445058, 1710206785442934785, '怎么把输入框固定到距离div底部20px的地方', NULL, 0, '2023-10-06 16:29:05', '2023-10-06 16:29:05', 0);
INSERT INTO `chat_history` (`id`, `chatRole`, `chatId`, `modelId`, `content`, `execMessage`, `status`, `createTime`, `updateTime`, `isDelete`) VALUES (1710210584169541633, 1, 1710206853990445058, 1710206785442934785, '你可以使用CSS的`position`属性来实现这个需求。首先，你需要给输入框和div都设置一个相对定位（relative），然后给输入框设置一个绝对定位（absolute）。在绝对定位中，你可以使用`bottom`属性来设置元素距离底部的距离。\n\n以下是一个简单的示例代码：\n\n```css\ndiv {\n  position: relative;\n}\n\ninput {\n  position: absolute;\n  bottom: 20px;\n}\n```\n\n在这个代码中，`div`是你想要固定输入框的元素，`input`是你的输入框元素。这段代码会让输入框始终保持在距离`div`底部20px的位置。', '', 0, '2023-10-06 16:29:12', '2023-10-06 16:29:12', 0);
INSERT INTO `chat_history` (`id`, `chatRole`, `chatId`, `modelId`, `content`, `execMessage`, `status`, `createTime`, `updateTime`, `isDelete`) VALUES (1710845220969082881, 0, 1710206853990445058, 1710206785442934785, 'ant-design-pro 路由跳转携带参数，可以不显示再地址上吗？怎么实现？', NULL, 0, '2023-10-08 10:31:01', '2023-10-08 10:31:01', 0);
INSERT INTO `chat_history` (`id`, `chatRole`, `chatId`, `modelId`, `content`, `execMessage`, `status`, `createTime`, `updateTime`, `isDelete`) VALUES (1710845889893462018, 0, 1710206853990445058, 1710206785442934785, '怎么获取到参数呢？', NULL, 0, '2023-10-08 10:33:40', '2023-10-08 10:33:40', 0);
INSERT INTO `chat_history` (`id`, `chatRole`, `chatId`, `modelId`, `content`, `execMessage`, `status`, `createTime`, `updateTime`, `isDelete`) VALUES (1710846364126638082, 0, 1710206853990445058, 1710206785442934785, 'ant-design-pro 路由跳转携带参数，可以不显示再地址上吗？怎么实现？怎么获取参数？', NULL, 0, '2023-10-08 10:35:33', '2023-10-08 10:35:33', 0);
INSERT INTO `chat_history` (`id`, `chatRole`, `chatId`, `modelId`, `content`, `execMessage`, `status`, `createTime`, `updateTime`, `isDelete`) VALUES (1710901596797906945, 0, 1710868351234424833, 1710640314391814145, '给点建议', NULL, 0, '2023-10-08 14:15:02', '2023-10-08 14:15:02', 0);
INSERT INTO `chat_history` (`id`, `chatRole`, `chatId`, `modelId`, `content`, `execMessage`, `status`, `createTime`, `updateTime`, `isDelete`) VALUES (1710902947112128514, 0, 1710868351234424833, 1710640314391814145, '给点建议', NULL, 0, '2023-10-08 14:20:24', '2023-10-08 14:20:24', 0);
INSERT INTO `chat_history` (`id`, `chatRole`, `chatId`, `modelId`, `content`, `execMessage`, `status`, `createTime`, `updateTime`, `isDelete`) VALUES (1711226845825409025, 0, 1711226573476667393, 1710206785442934785, '你能帮助我什么', NULL, 0, '2023-10-09 11:47:27', '2023-10-09 11:47:27', 0);
INSERT INTO `chat_history` (`id`, `chatRole`, `chatId`, `modelId`, `content`, `execMessage`, `status`, `createTime`, `updateTime`, `isDelete`) VALUES (1711227655527407617, 0, 1711227593044860930, 1711227464141316098, '你能给我提供什么帮助？', NULL, 0, '2023-10-09 11:50:40', '2023-10-09 11:50:40', 0);
INSERT INTO `chat_history` (`id`, `chatRole`, `chatId`, `modelId`, `content`, `execMessage`, `status`, `createTime`, `updateTime`, `isDelete`) VALUES (1711227727673630722, 0, 1711227593044860930, 1711227464141316098, 'hadoop怎么搭建集群？', NULL, 0, '2023-10-09 11:50:58', '2023-10-09 11:50:58', 0);
INSERT INTO `chat_history` (`id`, `chatRole`, `chatId`, `modelId`, `content`, `execMessage`, `status`, `createTime`, `updateTime`, `isDelete`) VALUES (1711228348644470786, 0, 1711227593044860930, 1711227464141316098, ' hadoop怎么搭建集群？', NULL, 0, '2023-10-09 11:53:26', '2023-10-09 11:53:26', 0);
INSERT INTO `chat_history` (`id`, `chatRole`, `chatId`, `modelId`, `content`, `execMessage`, `status`, `createTime`, `updateTime`, `isDelete`) VALUES (1711228434535428098, 1, 1711227593044860930, 1711227464141316098, '搭建Hadoop集群的步骤如下：\n\n1. 准备环境：确保所有节点已经安装了Java环境，并配置好JAVA_HOME环境变量。\n\n2. 下载Hadoop安装包：从官方网站下载最新版本的Hadoop安装包，例如：hadoop-3.3.0。\n\n3. 解压Hadoop安装包：将下载的Hadoop安装包解压到指定目录，例如：/usr/local/hadoop。\n\n4. 配置Hadoop环境变量：在每个节点的~/.bashrc或~/.bash_profile文件中添加以下内容：\n\n```\nexport HADOOP_HOME=/usr/local/hadoop\nexport PATH=$PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin\n```\n\n然后执行source ~/.bashrc或source ~/.bash_profile使配置生效。\n\n5. 配置Hadoop：修改Hadoop配置文件，主要包括core-site.xml、hdfs-site.xml和mapred-site.xml。主要配置项包括：\n\n- core-site.xml：设置Hadoop的核心参数，如fs.defaultFS、hadoop.tmp.dir等。\n- hdfs-site.xml：设置HDFS的相关参数，如namenode的地址、数据块的大小等。\n- mapred-site.xml：设置MapReduce的相关参数，如mapreduce.framework.name等。\n\n6. 格式化HDFS：在NameNode节点上执行以下命令，格式化HDFS文件系统：\n\n```\nhadoop namenode -format\n```\n\n7. 启动Hadoop集群：分别启动NameNode、DataNode和ResourceManager节点。可以使用以下命令启动各个组件：\n\n```\nstart-dfs.sh    # 启动HDFS\nstart-yarn.sh   # 启动YARN（可选，如果使用YARN作为资源管理器）\n```\n\n8. 验证Hadoop集群是否正常运行：使用jps命令查看各个节点的进程状态，确保所有节点都处于运行状态。同时，可以使用jstat、jconsole等工具查看Hadoop集群的性能指标。', '', 0, '2023-10-09 11:53:46', '2023-10-09 11:53:46', 0);
INSERT INTO `chat_history` (`id`, `chatRole`, `chatId`, `modelId`, `content`, `execMessage`, `status`, `createTime`, `updateTime`, `isDelete`) VALUES (1711233262544236545, 0, 1711226573476667393, 1710206785442934785, '你能帮我什么?', NULL, 0, '2023-10-09 12:12:57', '2023-10-09 12:12:57', 0);
INSERT INTO `chat_history` (`id`, `chatRole`, `chatId`, `modelId`, `content`, `execMessage`, `status`, `createTime`, `updateTime`, `isDelete`) VALUES (1711233269397729282, 1, 1711226573476667393, 1710206785442934785, '当然可以帮助你解答前端相关的问题。请随时告诉我你遇到的问题，我会尽力为你提供简洁明了的答案。', '', 0, '2023-10-09 12:12:59', '2023-10-09 12:12:59', 0);
INSERT INTO `chat_history` (`id`, `chatRole`, `chatId`, `modelId`, `content`, `execMessage`, `status`, `createTime`, `updateTime`, `isDelete`) VALUES (1711766218216144897, 0, 1710206853990445058, 1710206785442934785, '怎么让一个div靠右', NULL, 0, '2023-10-10 23:30:44', '2023-10-10 23:30:44', 0);
INSERT INTO `chat_history` (`id`, `chatRole`, `chatId`, `modelId`, `content`, `execMessage`, `status`, `createTime`, `updateTime`, `isDelete`) VALUES (1711766245210685441, 1, 1710206853990445058, 1710206785442934785, '要让一个div靠右，可以使用CSS的`float`属性。将`float`属性设置为`right`即可。以下是一个示例：\n\n```html\n<!DOCTYPE html>\n<html>\n<head>\n<style>\n  .right-div {\n    float: right;\n    background-color: lightblue;\n    padding: 10px;\n  }\n</style>\n</head>\n<body>\n\n<div class=\"right-div\">这个div靠右显示</div>\n<div>这个div正常显示</div>\n\n</body>\n</html>\n```', '', 0, '2023-10-10 23:30:50', '2023-10-10 23:30:50', 0);
INSERT INTO `chat_history` (`id`, `chatRole`, `chatId`, `modelId`, `content`, `execMessage`, `status`, `createTime`, `updateTime`, `isDelete`) VALUES (1716293234974101506, 0, 1716293012059426817, 1716292966333124609, '我有一个智能BI的项目，请你给我这个项目的简短介绍嘛?', NULL, 0, '2023-10-23 11:19:29', '2023-10-23 11:19:29', 0);
INSERT INTO `chat_history` (`id`, `chatRole`, `chatId`, `modelId`, `content`, `execMessage`, `status`, `createTime`, `updateTime`, `isDelete`) VALUES (1716293289516830721, 1, 1716293012059426817, 1716292966333124609, '智能BI（Business Intelligence，商业智能）是一种数据分析和报告工具，它通过收集、整理和分析大量数据，帮助企业从中发现有价值的信息和洞察。智能BI项目通常包括以下几个关键组件：\n\n1. 数据集成：将来自不同来源的数据整合在一起，以便在单个平台上进行分析。这可能包括数据库、文件系统和其他数据存储解决方案。\n\n2. 数据仓库：用于存储和管理整合后的数据的中央存储库。数据仓库通常包含多个层次结构，以支持不同类型的分析需求。\n\n3. 数据分析和报告：使用各种分析方法和工具对数据进行深入挖掘，以发现潜在的趋势、模式和关联。这些发现通常会以可视化报告的形式呈现，以便用户更容易理解和采取行动。\n\n4. 自助式BI：允许用户无需编写代码即可创建和定制报表、仪表板和分析模型的工具。这有助于降低数据分析门槛，提高用户的参与度。\n\n5. 移动BI：将BI功能扩展到移动设备上，使用户能够随时随地访问关键数据和分析结果。这有助于提高工作效率和决策能力。\n\n6. 实时BI：提供实时数据更新和警报功能，以便用户能够快速响应市场变化和业务需求。\n\n总之，智能BI项目旨在帮助企业更有效地利用数据驱动决策，提高业务绩效。通过提供统一的平台来整合、分析和可视化数据，智能BI可以帮助企业更好地了解其业务状况，发现潜在的机会和风险，并制定相应的战略和行动计划。', '', 0, '2023-10-23 11:19:42', '2023-10-23 11:19:42', 0);
INSERT INTO `chat_history` (`id`, `chatRole`, `chatId`, `modelId`, `content`, `execMessage`, `status`, `createTime`, `updateTime`, `isDelete`) VALUES (1716294916562849793, 0, 1716293012059426817, 1716292966333124609, 'AI辅助分析功能介绍', NULL, 0, '2023-10-23 11:26:10', '2023-10-23 11:26:10', 0);
INSERT INTO `chat_history` (`id`, `chatRole`, `chatId`, `modelId`, `content`, `execMessage`, `status`, `createTime`, `updateTime`, `isDelete`) VALUES (1716294957524422657, 1, 1716293012059426817, 1716292966333124609, 'AI辅助分析功能是一种利用人工智能技术（如机器学习和深度学习）来帮助用户分析和解释数据的功能。这种功能通常应用于各种数据分析工具和应用程序，如数据可视化、预测分析、文本挖掘等。通过使用AI辅助分析功能，用户可以更快速、更准确地从大量数据中提取有价值的信息，从而为决策提供支持。\n\n以下是一些AI辅助分析功能的示例：\n\n1. 数据可视化：AI可以帮助用户将复杂的数据集转换为易于理解的图表和图形，以便更好地展示数据之间的关系和趋势。\n\n2. 预测分析：AI可以根据历史数据和现有模式识别出潜在的趋势和关联，从而预测未来的发展情况。\n\n3. 文本挖掘：AI可以帮助用户从大量文本数据中提取关键信息，如主题、情感和观点，以便更好地了解客户需求和市场动态。\n\n4. 异常检测：AI可以自动识别出数据中的异常值和离群点，从而帮助用户发现潜在的问题和风险。\n\n5. 推荐系统：AI可以根据用户的行为和喜好为他们提供个性化的推荐，从而提高用户体验和满意度。\n\n总之，AI辅助分析功能可以帮助用户更有效地处理和分析数据，从而提高决策质量和业务效率。随着人工智能技术的不断发展，我们可以期待未来将出现更多创新的AI辅助分析功能。', '', 0, '2023-10-23 11:26:19', '2023-10-23 11:26:19', 0);
INSERT INTO `chat_history` (`id`, `chatRole`, `chatId`, `modelId`, `content`, `execMessage`, `status`, `createTime`, `updateTime`, `isDelete`) VALUES (1716451404455473154, 0, 1710206853990445058, 1710206785442934785, 'ant-design的input组件怎么按shift+enter实现input换行效果', NULL, 0, '2023-10-23 21:47:59', '2023-10-23 21:47:59', 0);
INSERT INTO `chat_history` (`id`, `chatRole`, `chatId`, `modelId`, `content`, `execMessage`, `status`, `createTime`, `updateTime`, `isDelete`) VALUES (1716451460571066369, 1, 1710206853990445058, 1710206785442934785, '在Ant Design的Input组件中，没有直接提供按Shift+Enter实现换行的功能。但是你可以通过监听键盘事件来实现这个需求。具体操作如下：\n\n1. 在Input组件上添加`onKeyDown`属性，用于监听键盘按下事件。\n2. 在`onKeyDown`事件处理函数中，判断是否按下了Shift键和Enter键。\n3. 如果同时按下了Shift键和Enter键，那么触发换行操作。\n\n代码示例：\n\n```jsx\nimport React, { useState } from \'react\';\nimport { Input } from \'antd\';\n\nconst App = () => {\n  const [value, setValue] = useState(\'\');\n\n  const handleKeyDown = (e) => {\n    if (e.shiftKey && e.keyCode === 13) { // 判断是否同时按下了Shift键和Enter键\n      e.preventDefault(); // 阻止默认行为，避免触发输入框的onChange事件\n      setValue(value + \'\n\'); // 实现换行效果\n    } else if (e.keyCode === 13) { // 判断是否按下了Enter键\n      e.preventDefault(); // 阻止默认行为，避免触发输入框的onChange事件\n      setValue(value + \'\n\'); // 实现换行效果\n    }\n  };\n\n  return (\n    <div>\n      <Input value={value} onKeyDown={handleKeyDown} />\n    </div>\n  );\n};\n\nexport default App;\n```\n\n这样，当你在Input组件中按Shift+Enter时，就可以实现换行效果了。', '', 0, '2023-10-23 21:48:12', '2023-10-23 21:48:12', 0);
INSERT INTO `chat_history` (`id`, `chatRole`, `chatId`, `modelId`, `content`, `execMessage`, `status`, `createTime`, `updateTime`, `isDelete`) VALUES (1716466057675927553, 0, 1716293012059426817, 1716292966333124609, 'web的会员服务该怎么设计？', NULL, 0, '2023-10-23 22:46:13', '2023-10-23 22:46:13', 0);
INSERT INTO `chat_history` (`id`, `chatRole`, `chatId`, `modelId`, `content`, `execMessage`, `status`, `createTime`, `updateTime`, `isDelete`) VALUES (1716466105436467202, 1, 1716293012059426817, 1716292966333124609, '设计Web会员服务时，需要考虑以下几个方面：\n\n1. 会员等级制度：根据会员的消费金额或活跃度，设定不同的会员等级，如普通会员、银卡会员、金卡会员等。每个等级可以享有不同的权益，如折扣、积分、专属客服等。\n\n2. 会员权益：为不同等级的会员提供相应的权益，如优惠券、积分兑换、会员活动等。这些权益可以提高用户的忠诚度和满意度。\n\n3. 会员管理：建立一个完善的会员管理系统，方便企业对会员信息进行管理和分析。例如，可以通过会员消费数据了解会员的喜好和需求，以便调整产品和服务。\n\n4. 会员沟通：通过邮件、短信、社交媒体等方式，定期向会员发送优惠信息、活动通知等，增加会员与企业的互动。\n\n5. 用户体验：优化网站的界面设计和操作流程，提高用户体验。例如，可以设置一键登录、个性化推荐等功能，方便会员使用。\n\n6. 数据分析：通过对会员数据的分析，了解会员的消费行为和喜好，为企业制定更精准的营销策略提供依据。\n\n7. 客户服务：提供优质的客户服务，解决会员在购物过程中遇到的问题，提高会员满意度。\n\n8. 安全保障：确保会员信息的安全，防止数据泄露和欺诈行为。例如，可以采用加密技术保护会员信息安全，设置支付密码等。\n\n总之，设计Web会员服务时，需要从多个方面考虑，以提高用户满意度和企业收益。', '', 0, '2023-10-23 22:46:24', '2023-10-23 22:46:24', 0);
INSERT INTO `chat_history` (`id`, `chatRole`, `chatId`, `modelId`, `content`, `execMessage`, `status`, `createTime`, `updateTime`, `isDelete`) VALUES (1716466328766377985, 0, 1716293012059426817, 1716292966333124609, '会员服务的库表怎么设计？', NULL, 0, '2023-10-23 22:47:17', '2023-10-23 22:47:17', 0);
INSERT INTO `chat_history` (`id`, `chatRole`, `chatId`, `modelId`, `content`, `execMessage`, `status`, `createTime`, `updateTime`, `isDelete`) VALUES (1716466383720148993, 1, 1716293012059426817, 1716292966333124609, '设计会员服务的库表需要考虑以下几个关键因素：\n\n1. 用户ID（User ID）：这是每个用户的唯一标识符，通常是一个自增的整数或字符串。\n\n2. 会员级别（Membership Level）：这表示用户的会员等级，可以根据不同的等级提供不同的会员服务。\n\n3. 注册日期（Registration Date）：这是用户注册成为会员的日期。\n\n4. 最后登录日期（Last Login Date）：这是用户最后一次登录系统的日期。\n\n5. 邮箱地址（Email Address）：这是用户的电子邮件地址，可以用于发送通知和促销信息。\n\n6. 手机号码（Phone Number）：这是用户的联系电话，可以用于发送通知和促销信息。\n\n7. 密码（Password）：这是用户的登录密码，需要加密存储以确保安全。\n\n8. 姓名（Name）：这是用户的姓名，用于显示在用户界面上。\n\n9. 地址（Address）：这是用户的邮寄地址，可以用于发送账单和其他相关文件。\n\n10. 生日（Birthday）：这是用户的生日，可以用于发送生日祝福和优惠券等。\n\n根据以上因素，可以设计如下的数据库表结构：\n\n```sql\nCREATE TABLE Membership (\n    UserID INT PRIMARY KEY,\n    MembershipLevel VARCHAR(50),\n    RegistrationDate DATE,\n    LastLoginDate DATE,\n    EmailAddress VARCHAR(100),\n    PhoneNumber VARCHAR(20),\n    PasswordHash VARCHAR(255),\n    Name VARCHAR(100),\n    Address VARCHAR(255),\n    Birthday DATE\n);\n```', '', 0, '2023-10-23 22:47:30', '2023-10-23 22:47:30', 0);

drop table if exists bi.failed_chart;
create table if not exists bi.failed_chart
(
    id          bigint auto_increment comment 'id'
        primary key,
    chartId     bigint                                 not null comment '图表id',
    status      varchar(128) default 'wait'            not null comment 'wait,running,succeed,failed',
    execMessage text                                   null comment '执行信息',
    retryNum    tinyint     default 0                  null comment '重试次数',
    userId      bigint                                 null comment '创建用户 id',
    createTime  datetime     default CURRENT_TIMESTAMP not null comment '创建时间',
    updateTime  datetime     default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '更新时间',
    isDelete    tinyint      default 0                 not null comment '是否删除'
)
    comment '失败分析表';


create table if not exists bi.product_order
(
    id             bigint auto_increment comment 'id'
        primary key,
    orderNo        varchar(256)                           not null comment '订单号',
    codeUrl        varchar(256)                           null comment '二维码地址',
    userId         bigint                                 not null comment '创建人',
    productId      bigint                                 not null comment '商品id',
    orderName      varchar(256)                           not null comment '商品名称',
    total          bigint                                 not null comment '金额(分)',
    productType    tinyint                                not null comment '产品类型 0-积分服务 1-会员服务',
    status         varchar(256) default 'NOTPAY'          not null comment '交易状态(SUCCESS：支付成功 REFUND：转入退款 NOTPAY：未支付 CLOSED：已关闭 REVOKED：已撤销（仅付款码支付会返回）
                                                                              USERPAYING：用户支付中（仅付款码支付会返回）PAYERROR：支付失败（仅付款码支付会返回）)',
    payType        varchar(256) default 'WX'              not null comment '支付方式（默认 WX- 微信 ZFB- 支付宝）',
    productInfo    text                                   null comment '商品信息',
    addPoints      bigint       default 0                 not null comment '增加积分个数',
    expirationTime datetime                               null comment '过期时间',
    createTime     datetime     default CURRENT_TIMESTAMP not null comment '创建时间',
    updateTime     datetime     default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '更新时间'
)
    comment '商品订单';
INSERT INTO `product_order` (`id`, `orderNo`, `codeUrl`, `userId`, `productId`, `orderName`, `total`, `productType`, `status`, `payType`, `productInfo`, `addPoints`, `expirationTime`, `createTime`, `updateTime`) VALUES (9, 'order:24676466328312320733', NULL, 1697633200786403330, 1, '100积分', 6, 0, 'SUCCESS', 'WX', NULL, 200, '2023-10-13 13:29:46', '2023-10-13 13:24:46', '2023-10-13 13:48:49');
INSERT INTO `product_order` (`id`, `orderNo`, `codeUrl`, `userId`, `productId`, `orderName`, `total`, `productType`, `status`, `payType`, `productInfo`, `addPoints`, `expirationTime`, `createTime`, `updateTime`) VALUES (10, 'order:99298602307702326280', NULL, 1697633200786403330, 1, '100积分', 6, 0, 'SUCCESS', 'WX', NULL, 200, '2023-10-13 13:46:54', '2023-10-13 13:41:54', '2023-10-13 13:48:49');
INSERT INTO `product_order` (`id`, `orderNo`, `codeUrl`, `userId`, `productId`, `orderName`, `total`, `productType`, `status`, `payType`, `productInfo`, `addPoints`, `expirationTime`, `createTime`, `updateTime`) VALUES (11, 'order:80716480607068787455', NULL, 1697633200786403330, 1, '100积分', 2, 0, 'SUCCESS', 'WX', NULL, 100, '2023-10-13 13:53:38', '2023-10-13 13:48:38', '2023-10-13 13:48:49');
INSERT INTO `product_order` (`id`, `orderNo`, `codeUrl`, `userId`, `productId`, `orderName`, `total`, `productType`, `status`, `payType`, `productInfo`, `addPoints`, `expirationTime`, `createTime`, `updateTime`) VALUES (12, 'order:24462069918570641732', NULL, 1697633200786403330, 1, '100积分', 2, 0, 'SUCCESS', 'WX', NULL, 100, '2023-10-13 13:56:44', '2023-10-13 13:51:44', '2023-10-13 13:51:45');
INSERT INTO `product_order` (`id`, `orderNo`, `codeUrl`, `userId`, `productId`, `orderName`, `total`, `productType`, `status`, `payType`, `productInfo`, `addPoints`, `expirationTime`, `createTime`, `updateTime`) VALUES (13, 'order:10804577930742742131', NULL, 1697633200786403330, 1, '100积分', 2, 0, 'SUCCESS', 'WX', NULL, 100, '2023-10-13 13:58:55', '2023-10-13 13:53:55', '2023-10-13 13:53:57');
INSERT INTO `product_order` (`id`, `orderNo`, `codeUrl`, `userId`, `productId`, `orderName`, `total`, `productType`, `status`, `payType`, `productInfo`, `addPoints`, `expirationTime`, `createTime`, `updateTime`) VALUES (14, 'order:65123471972178369611', NULL, 1697633200786403330, 3, '200积分', 10, 0, 'SUCCESS', 'WX', NULL, 200, '2023-10-13 13:59:06', '2023-10-13 13:54:05', '2023-10-13 13:54:07');
INSERT INTO `product_order` (`id`, `orderNo`, `codeUrl`, `userId`, `productId`, `orderName`, `total`, `productType`, `status`, `payType`, `productInfo`, `addPoints`, `expirationTime`, `createTime`, `updateTime`) VALUES (15, 'order:10156535308783452425', NULL, 1711226458418520066, 1, '100积分', 2, 0, 'SUCCESS', 'WX', NULL, 100, '2023-10-23 11:35:08', '2023-10-23 11:30:08', '2023-10-23 11:30:11');
INSERT INTO `product_order` (`id`, `orderNo`, `codeUrl`, `userId`, `productId`, `orderName`, `total`, `productType`, `status`, `payType`, `productInfo`, `addPoints`, `expirationTime`, `createTime`, `updateTime`) VALUES (16, 'order:26386420542461519252', NULL, 1711226458418520066, 1, '100积分', 2, 0, 'SUCCESS', 'WX', NULL, 100, '2023-10-23 22:38:00', '2023-10-23 22:33:00', '2023-10-23 22:39:35');
INSERT INTO `product_order` (`id`, `orderNo`, `codeUrl`, `userId`, `productId`, `orderName`, `total`, `productType`, `status`, `payType`, `productInfo`, `addPoints`, `expirationTime`, `createTime`, `updateTime`) VALUES (17, 'order:38931117270411037303', NULL, 1711226458418520066, 1, '100积分', 2, 0, 'SUCCESS', 'WX', NULL, 100, '2023-10-23 22:38:16', '2023-10-23 22:33:15', '2023-10-23 22:39:35');
INSERT INTO `product_order` (`id`, `orderNo`, `codeUrl`, `userId`, `productId`, `orderName`, `total`, `productType`, `status`, `payType`, `productInfo`, `addPoints`, `expirationTime`, `createTime`, `updateTime`) VALUES (18, 'order:59289478293806300242', NULL, 1711226458418520066, 1, '100积分', 2, 0, 'SUCCESS', 'WX', NULL, 100, '2023-10-23 22:44:34', '2023-10-23 22:39:34', '2023-10-23 22:39:35');
INSERT INTO `product_order` (`id`, `orderNo`, `codeUrl`, `userId`, `productId`, `orderName`, `total`, `productType`, `status`, `payType`, `productInfo`, `addPoints`, `expirationTime`, `createTime`, `updateTime`) VALUES (19, 'order:03265119758232889321', NULL, 1711226458418520066, 2, '会员（包月）', 15, 1, 'SUCCESS', 'WX', NULL, 0, '2023-10-23 23:44:46', '2023-10-23 23:39:45', '2023-10-23 23:46:02');
INSERT INTO `product_order` (`id`, `orderNo`, `codeUrl`, `userId`, `productId`, `orderName`, `total`, `productType`, `status`, `payType`, `productInfo`, `addPoints`, `expirationTime`, `createTime`, `updateTime`) VALUES (20, 'order:45787702087099764124', NULL, 1711226458418520066, 2, '会员（包月）', 15, 1, 'SUCCESS', 'WX', NULL, 0, '2023-10-23 23:51:00', '2023-10-23 23:45:59', '2023-10-23 23:46:02');
INSERT INTO `product_order` (`id`, `orderNo`, `codeUrl`, `userId`, `productId`, `orderName`, `total`, `productType`, `status`, `payType`, `productInfo`, `addPoints`, `expirationTime`, `createTime`, `updateTime`) VALUES (21, 'order:03083510648297312095', NULL, 1705187795989446657, 2, '会员（包月）', 15, 1, 'SUCCESS', 'WX', NULL, 0, '2023-10-23 23:57:47', '2023-10-23 23:52:47', '2023-10-23 23:54:19');
INSERT INTO `product_order` (`id`, `orderNo`, `codeUrl`, `userId`, `productId`, `orderName`, `total`, `productType`, `status`, `payType`, `productInfo`, `addPoints`, `expirationTime`, `createTime`, `updateTime`) VALUES (22, 'order:80979715251960889126', NULL, 1705187795989446657, 2, '会员（包月）', 15, 1, 'SUCCESS', 'WX', NULL, 0, '2023-10-23 23:59:18', '2023-10-23 23:54:17', '2023-10-23 23:54:19');


create table if not exists bi.product_point
(
    id             bigint auto_increment comment 'id'
        primary key,
    name           varchar(256)                       not null comment '产品名称',
    description    varchar(256)                       null comment '产品描述',
    userId         bigint                             null comment '创建人',
    total          bigint                             null comment '金额(分)',
    originalTotal  bigint                             not null comment '原价(分)',
    addPoints      bigint   default 0                 not null comment '增加积分个数',
    expirationTime datetime                           null comment '商品过期时间',
    createTime     datetime default CURRENT_TIMESTAMP not null comment '创建时间',
    updateTime     datetime default CURRENT_TIMESTAMP not null comment '更新时间',
    isDelete       tinyint  default 0                 not null comment '是否删除',
    status         tinyint  default 0                 not null comment '商品状态（0- 默认下线 1- 上线）'
)
    comment '产品信息';
INSERT INTO `product_point` (`id`, `name`, `description`, `userId`, `total`, `originalTotal`, `addPoints`, `expirationTime`, `createTime`, `updateTime`, `isDelete`, `status`) VALUES (1, '100积分', '100积分', 1697633200786403330, 200, 400, 100, NULL, '2023-10-10 11:23:54', '2023-10-10 11:23:54', 0, 0);
INSERT INTO `product_point` (`id`, `name`, `description`, `userId`, `total`, `originalTotal`, `addPoints`, `expirationTime`, `createTime`, `updateTime`, `isDelete`, `status`) VALUES (2, '200积分', '200积分', 1697633200786403330, 400, 700, 200, NULL, '2023-10-10 14:13:20', '2023-10-10 14:13:20', 1, 0);
INSERT INTO `product_point` (`id`, `name`, `description`, `userId`, `total`, `originalTotal`, `addPoints`, `expirationTime`, `createTime`, `updateTime`, `isDelete`, `status`) VALUES (3, '200积分', '200积分', 1697633200786403330, 1000, 2000, 200, NULL, '2023-10-10 22:30:20', '2023-10-10 22:30:20', 0, 0);
INSERT INTO `product_point` (`id`, `name`, `description`, `userId`, `total`, `originalTotal`, `addPoints`, `expirationTime`, `createTime`, `updateTime`, `isDelete`, `status`) VALUES (4, '500积分', '500积分', 1697633200786403330, 2000, 5000, 500, NULL, '2023-10-10 22:30:48', '2023-10-10 22:30:48', 0, 0);


create table if not exists bi.product_vip
(
    id             bigint auto_increment comment 'id'
        primary key,
    name           varchar(256)                       not null comment '产品名称',
    description    varchar(256)                       null comment '产品描述',
    userId         bigint                             null comment '创建人',
    productType    tinyint  default 0                 not null comment '产品类型（0-vip 1-sVip）',
    addPoints      bigint   default 0                 not null comment '增加积分个数',
    duration       int                                not null comment '-- 产品有效期',
    total          bigint                             null comment '金额(分)',
    originalTotal  bigint                             not null comment '原价（分）',
    createTime     datetime default CURRENT_TIMESTAMP not null comment '创建时间',
    updateTime     datetime default CURRENT_TIMESTAMP not null comment '更新时间',
    isDelete       tinyint  default 0                 not null comment '是否删除',
    status         tinyint  default 0                 not null comment '商品状态（0- 默认下线 1- 上线）',
    expirationTime datetime                           null comment '商品过期时间'
)
    comment '产品信息';
INSERT INTO `product_vip` (`id`, `name`, `description`, `userId`, `productType`, `addPoints`, `duration`, `total`, `originalTotal`, `createTime`, `updateTime`, `isDelete`, `status`, `expirationTime`) VALUES (1, '体验会员（3天）', '尊享3天会员权益', 1697633200786403330, 0, 0, 3, 200, 600, '2023-10-10 13:58:11', '2023-10-10 13:58:11', 0, 0, NULL);
INSERT INTO `product_vip` (`id`, `name`, `description`, `userId`, `productType`, `addPoints`, `duration`, `total`, `originalTotal`, `createTime`, `updateTime`, `isDelete`, `status`, `expirationTime`) VALUES (2, '会员（包月）', '尊享30天会员权限', 1697633200786403330, 0, 0, 30, 1500, 3000, '2023-10-10 22:35:45', '2023-10-10 22:35:45', 0, 0, NULL);
INSERT INTO `product_vip` (`id`, `name`, `description`, `userId`, `productType`, `addPoints`, `duration`, `total`, `originalTotal`, `createTime`, `updateTime`, `isDelete`, `status`, `expirationTime`) VALUES (3, '超级会员（包月）', '超级会员（包月）', 1697633200786403330, 0, 0, 30, 2500, 5000, '2023-10-10 22:38:10', '2023-10-10 22:38:10', 0, 0, NULL);


create table if not exists bi.reward_record
(
    id           bigint                             null,
    userId       bigint                             not null comment '领取用户id',
    rewardPoints int      default 0                 null comment '奖励积分',
    createTime   datetime default CURRENT_TIMESTAMP not null comment '创建时间',
    updateTime   datetime default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '更新时间',
    isDelete     tinyint  default 0                 not null comment '是否删除'
)
    comment '奖励积分领取表';
INSERT INTO `reward_record` (`id`, `userId`, `rewardPoints`, `createTime`, `updateTime`, `isDelete`) VALUES (1705227202163388418, 1697633200786403330, 10, '2023-09-22 22:27:01', '2023-09-22 22:27:01', 0);
INSERT INTO `reward_record` (`id`, `userId`, `rewardPoints`, `createTime`, `updateTime`, `isDelete`) VALUES (1705396727123046401, 1697633200786403330, 10, '2023-09-23 09:40:39', '2023-09-23 09:40:39', 0);
INSERT INTO `reward_record` (`id`, `userId`, `rewardPoints`, `createTime`, `updateTime`, `isDelete`) VALUES (1705851408400003073, 1697633200786403330, 10, '2023-09-24 15:47:23', '2023-09-24 15:47:23', 0);
INSERT INTO `reward_record` (`id`, `userId`, `rewardPoints`, `createTime`, `updateTime`, `isDelete`) VALUES (1706163474411335681, 1697633200786403330, 10, '2023-09-25 12:27:25', '2023-09-25 12:27:25', 0);
INSERT INTO `reward_record` (`id`, `userId`, `rewardPoints`, `createTime`, `updateTime`, `isDelete`) VALUES (1706462999629811714, 1697633200786403330, 10, '2023-09-26 08:17:38', '2023-09-26 08:17:38', 0);
INSERT INTO `reward_record` (`id`, `userId`, `rewardPoints`, `createTime`, `updateTime`, `isDelete`) VALUES (1707068233766965249, 1697633200786403330, 10, '2023-09-28 00:22:37', '2023-09-28 00:22:37', 0);
INSERT INTO `reward_record` (`id`, `userId`, `rewardPoints`, `createTime`, `updateTime`, `isDelete`) VALUES (1707666595490930689, 1697633200786403330, 10, '2023-09-29 16:00:17', '2023-09-29 16:00:17', 0);
INSERT INTO `reward_record` (`id`, `userId`, `rewardPoints`, `createTime`, `updateTime`, `isDelete`) VALUES (1708520806604619777, 1697633200786403330, 10, '2023-10-02 00:34:37', '2023-10-02 00:34:37', 0);
INSERT INTO `reward_record` (`id`, `userId`, `rewardPoints`, `createTime`, `updateTime`, `isDelete`) VALUES (1709783426443898882, 1697633200786403330, 10, '2023-10-05 12:11:49', '2023-10-05 12:11:49', 0);
INSERT INTO `reward_record` (`id`, `userId`, `rewardPoints`, `createTime`, `updateTime`, `isDelete`) VALUES (1710296539551236097, 1697633200786403330, 10, '2023-10-06 22:10:45', '2023-10-06 22:10:45', 0);
INSERT INTO `reward_record` (`id`, `userId`, `rewardPoints`, `createTime`, `updateTime`, `isDelete`) VALUES (1710623794454368257, 1697633200786403330, 10, '2023-10-07 19:51:09', '2023-10-07 19:51:09', 0);
INSERT INTO `reward_record` (`id`, `userId`, `rewardPoints`, `createTime`, `updateTime`, `isDelete`) VALUES (1710835164991025154, 1697633200786403330, 10, '2023-10-08 09:51:03', '2023-10-08 09:51:03', 0);
INSERT INTO `reward_record` (`id`, `userId`, `rewardPoints`, `createTime`, `updateTime`, `isDelete`) VALUES (1711226715449663490, 1711226458418520066, 10, '2023-10-09 11:46:56', '2023-10-09 11:46:56', 0);
INSERT INTO `reward_record` (`id`, `userId`, `rewardPoints`, `createTime`, `updateTime`, `isDelete`) VALUES (1711351541120114689, 1711350501649948674, 10, '2023-10-09 20:02:57', '2023-10-09 20:02:57', 0);
INSERT INTO `reward_record` (`id`, `userId`, `rewardPoints`, `createTime`, `updateTime`, `isDelete`) VALUES (1711418492504780802, 1711350501649948674, 10, '2023-10-10 00:28:59', '2023-10-10 00:28:59', 0);
INSERT INTO `reward_record` (`id`, `userId`, `rewardPoints`, `createTime`, `updateTime`, `isDelete`) VALUES (1712016359342854146, 1697633200786403330, 10, '2023-10-11 16:04:42', '2023-10-11 16:04:42', 0);
INSERT INTO `reward_record` (`id`, `userId`, `rewardPoints`, `createTime`, `updateTime`, `isDelete`) VALUES (1716301123327463425, 1697633200786403330, 10, '2023-10-23 11:50:49', '2023-10-23 11:50:49', 0);
INSERT INTO `reward_record` (`id`, `userId`, `rewardPoints`, `createTime`, `updateTime`, `isDelete`) VALUES (1716459903700824066, 1711226458418520066, 10, '2023-10-23 22:21:45', '2023-10-23 22:21:45', 0);


create table if not exists bi.service_record
(
    id         bigint                             not null
        primary key,
    userId     bigint                             not null comment '调用服务者',
    type       tinyint                            not null comment '调用服务类型',
    createTime datetime default CURRENT_TIMESTAMP null,
    updateTime datetime default CURRENT_TIMESTAMP null,
    isDelete   tinyint  default 0                 null
)
    comment '服务调用记录表';
INSERT INTO `service_record` (`id`, `userId`, `type`, `createTime`, `updateTime`, `isDelete`) VALUES (16023704561, 1697633200786403330, 0, '2023-09-29 16:30:26', '2023-09-29 16:30:31', 0);
INSERT INTO `service_record` (`id`, `userId`, `type`, `createTime`, `updateTime`, `isDelete`) VALUES (16023704562, 1697633200786403330, 0, '2023-09-29 16:30:46', '2023-09-29 16:30:49', 0);
INSERT INTO `service_record` (`id`, `userId`, `type`, `createTime`, `updateTime`, `isDelete`) VALUES (16023704563, 1697633200786403330, 0, '2023-09-28 16:31:04', '2023-09-28 16:31:09', 0);
INSERT INTO `service_record` (`id`, `userId`, `type`, `createTime`, `updateTime`, `isDelete`) VALUES (16023704566, 1697633200786403330, 0, '2023-07-29 16:31:29', '2023-07-29 16:31:33', 0);
INSERT INTO `service_record` (`id`, `userId`, `type`, `createTime`, `updateTime`, `isDelete`) VALUES (16023704567, 1697633200786403330, 1, '2023-09-29 20:22:53', '2023-09-29 20:22:56', 0);
INSERT INTO `service_record` (`id`, `userId`, `type`, `createTime`, `updateTime`, `isDelete`) VALUES (16023704569, 1697633200786403330, 1, '2023-09-23 20:23:25', '2023-09-23 20:23:28', 0);
INSERT INTO `service_record` (`id`, `userId`, `type`, `createTime`, `updateTime`, `isDelete`) VALUES (1707739394272260098, 1697633200786403330, 1, '2023-09-29 20:49:34', '2023-09-29 20:49:34', 0);
INSERT INTO `service_record` (`id`, `userId`, `type`, `createTime`, `updateTime`, `isDelete`) VALUES (1707739629853732865, 1697633200786403330, 0, '2023-09-29 20:50:30', '2023-09-29 20:50:30', 0);
INSERT INTO `service_record` (`id`, `userId`, `type`, `createTime`, `updateTime`, `isDelete`) VALUES (1707742659395317761, 1697633200786403330, 1, '2023-09-29 21:02:32', '2023-09-29 21:02:32', 0);
INSERT INTO `service_record` (`id`, `userId`, `type`, `createTime`, `updateTime`, `isDelete`) VALUES (1707746839166054401, 1697633200786403330, 1, '2023-09-29 21:19:09', '2023-09-29 21:19:09', 0);
INSERT INTO `service_record` (`id`, `userId`, `type`, `createTime`, `updateTime`, `isDelete`) VALUES (1707764059661254658, 1697633200786403330, 1, '2023-09-29 22:27:35', '2023-09-29 22:27:35', 0);
INSERT INTO `service_record` (`id`, `userId`, `type`, `createTime`, `updateTime`, `isDelete`) VALUES (1708520476106047490, 1697633200786403330, 1, '2023-10-02 00:33:18', '2023-10-02 00:33:18', 0);
INSERT INTO `service_record` (`id`, `userId`, `type`, `createTime`, `updateTime`, `isDelete`) VALUES (1708521106736431106, 1697633200786403330, 1, '2023-10-02 00:35:49', '2023-10-02 00:35:49', 0);
INSERT INTO `service_record` (`id`, `userId`, `type`, `createTime`, `updateTime`, `isDelete`) VALUES (1708523877422350338, 1697633200786403330, 1, '2023-10-02 00:46:49', '2023-10-02 00:46:49', 0);
INSERT INTO `service_record` (`id`, `userId`, `type`, `createTime`, `updateTime`, `isDelete`) VALUES (1708524090354581505, 1697633200786403330, 1, '2023-10-02 00:47:40', '2023-10-02 00:47:40', 0);
INSERT INTO `service_record` (`id`, `userId`, `type`, `createTime`, `updateTime`, `isDelete`) VALUES (1708525975648092161, 1697633200786403330, 1, '2023-10-02 00:55:10', '2023-10-02 00:55:10', 0);
INSERT INTO `service_record` (`id`, `userId`, `type`, `createTime`, `updateTime`, `isDelete`) VALUES (1708530693845827585, 1697633200786403330, 1, '2023-10-02 01:13:55', '2023-10-02 01:13:55', 0);
INSERT INTO `service_record` (`id`, `userId`, `type`, `createTime`, `updateTime`, `isDelete`) VALUES (1708530857100722178, 1697633200786403330, 1, '2023-10-02 01:14:33', '2023-10-02 01:14:33', 0);
INSERT INTO `service_record` (`id`, `userId`, `type`, `createTime`, `updateTime`, `isDelete`) VALUES (1708531783601504257, 1697633200786403330, 1, '2023-10-02 01:18:14', '2023-10-02 01:18:14', 0);
INSERT INTO `service_record` (`id`, `userId`, `type`, `createTime`, `updateTime`, `isDelete`) VALUES (1708532488001306625, 1697633200786403330, 1, '2023-10-02 01:21:02', '2023-10-02 01:21:02', 0);
INSERT INTO `service_record` (`id`, `userId`, `type`, `createTime`, `updateTime`, `isDelete`) VALUES (1708533312777633793, 1697633200786403330, 1, '2023-10-02 01:24:19', '2023-10-02 01:24:19', 0);
INSERT INTO `service_record` (`id`, `userId`, `type`, `createTime`, `updateTime`, `isDelete`) VALUES (1708543438783791106, 1697633200786403330, 1, '2023-10-02 02:04:33', '2023-10-02 02:04:33', 0);
INSERT INTO `service_record` (`id`, `userId`, `type`, `createTime`, `updateTime`, `isDelete`) VALUES (1709439092884328449, 1697633200786403330, 1, '2023-10-04 13:23:34', '2023-10-04 13:23:34', 0);
INSERT INTO `service_record` (`id`, `userId`, `type`, `createTime`, `updateTime`, `isDelete`) VALUES (1709448148420218882, 1697633200786403330, 1, '2023-10-04 13:59:33', '2023-10-04 13:59:33', 0);
INSERT INTO `service_record` (`id`, `userId`, `type`, `createTime`, `updateTime`, `isDelete`) VALUES (1709487918018023425, 1697633200786403330, 1, '2023-10-04 16:37:35', '2023-10-04 16:37:35', 0);
INSERT INTO `service_record` (`id`, `userId`, `type`, `createTime`, `updateTime`, `isDelete`) VALUES (1709489119237328898, 1697633200786403330, 1, '2023-10-04 16:42:21', '2023-10-04 16:42:21', 0);
INSERT INTO `service_record` (`id`, `userId`, `type`, `createTime`, `updateTime`, `isDelete`) VALUES (1709497990483890177, 1697633200786403330, 1, '2023-10-04 17:17:36', '2023-10-04 17:17:36', 0);
INSERT INTO `service_record` (`id`, `userId`, `type`, `createTime`, `updateTime`, `isDelete`) VALUES (1709514480977207297, 1697633200786403330, 1, '2023-10-04 18:23:08', '2023-10-04 18:23:08', 0);
INSERT INTO `service_record` (`id`, `userId`, `type`, `createTime`, `updateTime`, `isDelete`) VALUES (1709515251219173378, 1697633200786403330, 1, '2023-10-04 18:26:11', '2023-10-04 18:26:11', 0);
INSERT INTO `service_record` (`id`, `userId`, `type`, `createTime`, `updateTime`, `isDelete`) VALUES (1709515680967561218, 1697633200786403330, 1, '2023-10-04 18:27:54', '2023-10-04 18:27:54', 0);
INSERT INTO `service_record` (`id`, `userId`, `type`, `createTime`, `updateTime`, `isDelete`) VALUES (1709515709203615747, 1697633200786403330, 1, '2023-10-04 18:28:01', '2023-10-04 18:28:01', 0);
INSERT INTO `service_record` (`id`, `userId`, `type`, `createTime`, `updateTime`, `isDelete`) VALUES (1709516204567695361, 1697633200786403330, 1, '2023-10-04 18:29:59', '2023-10-04 18:29:59', 0);
INSERT INTO `service_record` (`id`, `userId`, `type`, `createTime`, `updateTime`, `isDelete`) VALUES (1709518028796334083, 1697633200786403330, 1, '2023-10-04 18:37:14', '2023-10-04 18:37:14', 0);
INSERT INTO `service_record` (`id`, `userId`, `type`, `createTime`, `updateTime`, `isDelete`) VALUES (1709518241929891842, 1697633200786403330, 1, '2023-10-04 18:38:04', '2023-10-04 18:38:04', 0);
INSERT INTO `service_record` (`id`, `userId`, `type`, `createTime`, `updateTime`, `isDelete`) VALUES (1709518842352898050, 1697633200786403330, 1, '2023-10-04 18:40:27', '2023-10-04 18:40:27', 0);
INSERT INTO `service_record` (`id`, `userId`, `type`, `createTime`, `updateTime`, `isDelete`) VALUES (1709519821668356099, 1697633200786403330, 1, '2023-10-04 18:44:21', '2023-10-04 18:44:21', 0);
INSERT INTO `service_record` (`id`, `userId`, `type`, `createTime`, `updateTime`, `isDelete`) VALUES (1709519920284831746, 1697633200786403330, 1, '2023-10-04 18:44:45', '2023-10-04 18:44:45', 0);
INSERT INTO `service_record` (`id`, `userId`, `type`, `createTime`, `updateTime`, `isDelete`) VALUES (1709520421072146434, 1697633200786403330, 1, '2023-10-04 18:46:44', '2023-10-04 18:46:44', 0);
INSERT INTO `service_record` (`id`, `userId`, `type`, `createTime`, `updateTime`, `isDelete`) VALUES (1709520560104935427, 1697633200786403330, 1, '2023-10-04 18:47:17', '2023-10-04 18:47:17', 0);
INSERT INTO `service_record` (`id`, `userId`, `type`, `createTime`, `updateTime`, `isDelete`) VALUES (1709526252375355394, 1697633200786403330, 1, '2023-10-04 19:09:54', '2023-10-04 19:09:54', 0);
INSERT INTO `service_record` (`id`, `userId`, `type`, `createTime`, `updateTime`, `isDelete`) VALUES (1709527572209577985, 1697633200786403330, 1, '2023-10-04 19:15:09', '2023-10-04 19:15:09', 0);
INSERT INTO `service_record` (`id`, `userId`, `type`, `createTime`, `updateTime`, `isDelete`) VALUES (1709528246985011201, 1697633200786403330, 1, '2023-10-04 19:17:50', '2023-10-04 19:17:50', 0);
INSERT INTO `service_record` (`id`, `userId`, `type`, `createTime`, `updateTime`, `isDelete`) VALUES (1709528304912543745, 1697633200786403330, 1, '2023-10-04 19:18:04', '2023-10-04 19:18:04', 0);
INSERT INTO `service_record` (`id`, `userId`, `type`, `createTime`, `updateTime`, `isDelete`) VALUES (1709528528779325441, 1697633200786403330, 1, '2023-10-04 19:18:57', '2023-10-04 19:18:57', 0);
INSERT INTO `service_record` (`id`, `userId`, `type`, `createTime`, `updateTime`, `isDelete`) VALUES (1709528587658964993, 1697633200786403330, 1, '2023-10-04 19:19:11', '2023-10-04 19:19:11', 0);
INSERT INTO `service_record` (`id`, `userId`, `type`, `createTime`, `updateTime`, `isDelete`) VALUES (1709529193626841090, 1697633200786403330, 1, '2023-10-04 19:21:35', '2023-10-04 19:21:35', 0);
INSERT INTO `service_record` (`id`, `userId`, `type`, `createTime`, `updateTime`, `isDelete`) VALUES (1709530609091194883, 1697633200786403330, 1, '2023-10-04 19:27:13', '2023-10-04 19:27:13', 0);
INSERT INTO `service_record` (`id`, `userId`, `type`, `createTime`, `updateTime`, `isDelete`) VALUES (1709530736480595970, 1697633200786403330, 1, '2023-10-04 19:27:43', '2023-10-04 19:27:43', 0);
INSERT INTO `service_record` (`id`, `userId`, `type`, `createTime`, `updateTime`, `isDelete`) VALUES (1709531872948236291, 1697633200786403330, 1, '2023-10-04 19:32:14', '2023-10-04 19:32:14', 0);
INSERT INTO `service_record` (`id`, `userId`, `type`, `createTime`, `updateTime`, `isDelete`) VALUES (1709532022919770115, 1697633200786403330, 1, '2023-10-04 19:32:50', '2023-10-04 19:32:50', 0);
INSERT INTO `service_record` (`id`, `userId`, `type`, `createTime`, `updateTime`, `isDelete`) VALUES (1709538990581460994, 1697633200786403330, 1, '2023-10-04 20:00:31', '2023-10-04 20:00:31', 0);
INSERT INTO `service_record` (`id`, `userId`, `type`, `createTime`, `updateTime`, `isDelete`) VALUES (1709539280735023106, 1697633200786403330, 1, '2023-10-04 20:01:40', '2023-10-04 20:01:40', 0);
INSERT INTO `service_record` (`id`, `userId`, `type`, `createTime`, `updateTime`, `isDelete`) VALUES (1709539464546201602, 1697633200786403330, 1, '2023-10-04 20:02:24', '2023-10-04 20:02:24', 0);
INSERT INTO `service_record` (`id`, `userId`, `type`, `createTime`, `updateTime`, `isDelete`) VALUES (1709539583567966209, 1697633200786403330, 1, '2023-10-04 20:02:53', '2023-10-04 20:02:53', 0);
INSERT INTO `service_record` (`id`, `userId`, `type`, `createTime`, `updateTime`, `isDelete`) VALUES (1709539631416586241, 1697633200786403330, 1, '2023-10-04 20:03:04', '2023-10-04 20:03:04', 0);
INSERT INTO `service_record` (`id`, `userId`, `type`, `createTime`, `updateTime`, `isDelete`) VALUES (1709539664148934658, 1697633200786403330, 1, '2023-10-04 20:03:12', '2023-10-04 20:03:12', 0);
INSERT INTO `service_record` (`id`, `userId`, `type`, `createTime`, `updateTime`, `isDelete`) VALUES (1709539875898372097, 1697633200786403330, 1, '2023-10-04 20:04:02', '2023-10-04 20:04:02', 0);
INSERT INTO `service_record` (`id`, `userId`, `type`, `createTime`, `updateTime`, `isDelete`) VALUES (1709539899831070722, 1697633200786403330, 1, '2023-10-04 20:04:08', '2023-10-04 20:04:08', 0);
INSERT INTO `service_record` (`id`, `userId`, `type`, `createTime`, `updateTime`, `isDelete`) VALUES (1709539924590047234, 1697633200786403330, 1, '2023-10-04 20:04:14', '2023-10-04 20:04:14', 0);
INSERT INTO `service_record` (`id`, `userId`, `type`, `createTime`, `updateTime`, `isDelete`) VALUES (1709540331684999171, 1697633200786403330, 1, '2023-10-04 20:05:51', '2023-10-04 20:05:51', 0);
INSERT INTO `service_record` (`id`, `userId`, `type`, `createTime`, `updateTime`, `isDelete`) VALUES (1709541363118878722, 1697633200786403330, 1, '2023-10-04 20:09:57', '2023-10-04 20:09:57', 0);
INSERT INTO `service_record` (`id`, `userId`, `type`, `createTime`, `updateTime`, `isDelete`) VALUES (1709543636171599874, 1697633200786403330, 1, '2023-10-04 20:18:59', '2023-10-04 20:18:59', 0);
INSERT INTO `service_record` (`id`, `userId`, `type`, `createTime`, `updateTime`, `isDelete`) VALUES (1709543740479746050, 1697633200786403330, 1, '2023-10-04 20:19:24', '2023-10-04 20:19:24', 0);
INSERT INTO `service_record` (`id`, `userId`, `type`, `createTime`, `updateTime`, `isDelete`) VALUES (1709555721475567618, 1697633200786403330, 1, '2023-10-04 21:07:00', '2023-10-04 21:07:00', 0);
INSERT INTO `service_record` (`id`, `userId`, `type`, `createTime`, `updateTime`, `isDelete`) VALUES (1709555962908094466, 1697633200786403330, 1, '2023-10-04 21:07:58', '2023-10-04 21:07:58', 0);
INSERT INTO `service_record` (`id`, `userId`, `type`, `createTime`, `updateTime`, `isDelete`) VALUES (1709556582822031363, 1697633200786403330, 1, '2023-10-04 21:10:26', '2023-10-04 21:10:26', 0);
INSERT INTO `service_record` (`id`, `userId`, `type`, `createTime`, `updateTime`, `isDelete`) VALUES (1709774844096802818, 1697633200786403330, 1, '2023-10-05 11:37:43', '2023-10-05 11:37:43', 0);
INSERT INTO `service_record` (`id`, `userId`, `type`, `createTime`, `updateTime`, `isDelete`) VALUES (1709775733612212226, 1697633200786403330, 1, '2023-10-05 11:41:15', '2023-10-05 11:41:15', 0);
INSERT INTO `service_record` (`id`, `userId`, `type`, `createTime`, `updateTime`, `isDelete`) VALUES (1709778850235936770, 1697633200786403330, 1, '2023-10-05 11:53:38', '2023-10-05 11:53:38', 0);
INSERT INTO `service_record` (`id`, `userId`, `type`, `createTime`, `updateTime`, `isDelete`) VALUES (1709781684708831233, 1697633200786403330, 1, '2023-10-05 12:04:54', '2023-10-05 12:04:54', 0);
INSERT INTO `service_record` (`id`, `userId`, `type`, `createTime`, `updateTime`, `isDelete`) VALUES (1709781796960989186, 1697633200786403330, 1, '2023-10-05 12:05:21', '2023-10-05 12:05:21', 0);
INSERT INTO `service_record` (`id`, `userId`, `type`, `createTime`, `updateTime`, `isDelete`) VALUES (1709784791945703426, 1697633200786403330, 1, '2023-10-05 12:17:15', '2023-10-05 12:17:15', 0);
INSERT INTO `service_record` (`id`, `userId`, `type`, `createTime`, `updateTime`, `isDelete`) VALUES (1709785225301192705, 1697633200786403330, 1, '2023-10-05 12:18:58', '2023-10-05 12:18:58', 0);
INSERT INTO `service_record` (`id`, `userId`, `type`, `createTime`, `updateTime`, `isDelete`) VALUES (1709805507097260035, 1697633200786403330, 1, '2023-10-05 13:39:34', '2023-10-05 13:39:34', 0);
INSERT INTO `service_record` (`id`, `userId`, `type`, `createTime`, `updateTime`, `isDelete`) VALUES (1710210557401493506, 1697633200786403330, 1, '2023-10-06 16:29:05', '2023-10-06 16:29:05', 0);
INSERT INTO `service_record` (`id`, `userId`, `type`, `createTime`, `updateTime`, `isDelete`) VALUES (1710630346942877698, 1697633200786403330, 0, '2023-10-07 20:17:11', '2023-10-07 20:17:11', 0);
INSERT INTO `service_record` (`id`, `userId`, `type`, `createTime`, `updateTime`, `isDelete`) VALUES (1710635690771390465, 1697633200786403330, 1, '2023-10-07 20:38:25', '2023-10-07 20:38:25', 0);
INSERT INTO `service_record` (`id`, `userId`, `type`, `createTime`, `updateTime`, `isDelete`) VALUES (1710636018199732226, 1697633200786403330, 1, '2023-10-07 20:39:43', '2023-10-07 20:39:43', 0);
INSERT INTO `service_record` (`id`, `userId`, `type`, `createTime`, `updateTime`, `isDelete`) VALUES (1710638413977837570, 1697633200786403330, 1, '2023-10-07 20:49:14', '2023-10-07 20:49:14', 0);
INSERT INTO `service_record` (`id`, `userId`, `type`, `createTime`, `updateTime`, `isDelete`) VALUES (1710638710452215809, 1697633200786403330, 1, '2023-10-07 20:50:25', '2023-10-07 20:50:25', 0);
INSERT INTO `service_record` (`id`, `userId`, `type`, `createTime`, `updateTime`, `isDelete`) VALUES (1710845221388513281, 1697633200786403330, 1, '2023-10-08 10:31:01', '2023-10-08 10:31:01', 0);
INSERT INTO `service_record` (`id`, `userId`, `type`, `createTime`, `updateTime`, `isDelete`) VALUES (1710845889893462019, 1697633200786403330, 1, '2023-10-08 10:33:40', '2023-10-08 10:33:40', 0);
INSERT INTO `service_record` (`id`, `userId`, `type`, `createTime`, `updateTime`, `isDelete`) VALUES (1710846364126638083, 1697633200786403330, 1, '2023-10-08 10:35:33', '2023-10-08 10:35:33', 0);
INSERT INTO `service_record` (`id`, `userId`, `type`, `createTime`, `updateTime`, `isDelete`) VALUES (1710902947481227266, 1697633200786403330, 1, '2023-10-08 14:20:24', '2023-10-08 14:20:24', 0);
INSERT INTO `service_record` (`id`, `userId`, `type`, `createTime`, `updateTime`, `isDelete`) VALUES (1710903499489382402, 1697633200786403330, 1, '2023-10-08 14:22:35', '2023-10-08 14:22:35', 0);
INSERT INTO `service_record` (`id`, `userId`, `type`, `createTime`, `updateTime`, `isDelete`) VALUES (1711226846173536257, 1711226458418520066, 1, '2023-10-09 11:47:27', '2023-10-09 11:47:27', 0);
INSERT INTO `service_record` (`id`, `userId`, `type`, `createTime`, `updateTime`, `isDelete`) VALUES (1711227369069027329, 1711226458418520066, 1, '2023-10-09 11:49:32', '2023-10-09 11:49:32', 0);
INSERT INTO `service_record` (`id`, `userId`, `type`, `createTime`, `updateTime`, `isDelete`) VALUES (1711227412345856002, 1711226458418520066, 1, '2023-10-09 11:49:42', '2023-10-09 11:49:42', 0);
INSERT INTO `service_record` (`id`, `userId`, `type`, `createTime`, `updateTime`, `isDelete`) VALUES (1711227655527407618, 1711226458418520066, 1, '2023-10-09 11:50:40', '2023-10-09 11:50:40', 0);
INSERT INTO `service_record` (`id`, `userId`, `type`, `createTime`, `updateTime`, `isDelete`) VALUES (1711227727673630723, 1711226458418520066, 1, '2023-10-09 11:50:58', '2023-10-09 11:50:58', 0);
INSERT INTO `service_record` (`id`, `userId`, `type`, `createTime`, `updateTime`, `isDelete`) VALUES (1711228348992598017, 1711226458418520066, 1, '2023-10-09 11:53:26', '2023-10-09 11:53:26', 0);
INSERT INTO `service_record` (`id`, `userId`, `type`, `createTime`, `updateTime`, `isDelete`) VALUES (1711233262544236546, 1711226458418520066, 1, '2023-10-09 12:12:57', '2023-10-09 12:12:57', 0);
INSERT INTO `service_record` (`id`, `userId`, `type`, `createTime`, `updateTime`, `isDelete`) VALUES (1711355882224754691, 1711350501649948674, 0, '2023-10-09 20:20:12', '2023-10-09 20:20:12', 0);
INSERT INTO `service_record` (`id`, `userId`, `type`, `createTime`, `updateTime`, `isDelete`) VALUES (1711766218606215170, 1697633200786403330, 1, '2023-10-10 23:30:44', '2023-10-10 23:30:44', 0);
INSERT INTO `service_record` (`id`, `userId`, `type`, `createTime`, `updateTime`, `isDelete`) VALUES (1716293235624218625, 1711226458418520066, 1, '2023-10-23 11:19:29', '2023-10-23 11:19:29', 0);
INSERT INTO `service_record` (`id`, `userId`, `type`, `createTime`, `updateTime`, `isDelete`) VALUES (1716294916697067522, 1711226458418520066, 1, '2023-10-23 11:26:10', '2023-10-23 11:26:10', 0);
INSERT INTO `service_record` (`id`, `userId`, `type`, `createTime`, `updateTime`, `isDelete`) VALUES (1716451404904263681, 1697633200786403330, 1, '2023-10-23 21:47:59', '2023-10-23 21:47:59', 0);
INSERT INTO `service_record` (`id`, `userId`, `type`, `createTime`, `updateTime`, `isDelete`) VALUES (1716466057738842114, 1711226458418520066, 1, '2023-10-23 22:46:13', '2023-10-23 22:46:13', 0);
INSERT INTO `service_record` (`id`, `userId`, `type`, `createTime`, `updateTime`, `isDelete`) VALUES (1716466328766377986, 1711226458418520066, 1, '2023-10-23 22:47:17', '2023-10-23 22:47:17', 0);


create table if not exists bi.user
(
    id                 bigint auto_increment comment 'id'
        primary key,
    userAccount        varchar(256)                           not null comment '账号',
    userPassword       varchar(512)                           not null comment '密码',
    userName           varchar(256)                           null comment '用户昵称',
    email              varchar(255)                           null comment '邮箱',
    userAvatar         varchar(1024)                          null comment '用户头像',
    createTime         datetime     default CURRENT_TIMESTAMP not null comment '创建时间',
    updateTime         datetime     default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '更新时间',
    isDelete           tinyint      default 0                 not null comment '是否删除',
    userRole           varchar(256) default 'user'            not null comment '用户角色：user/admin',
    totalRewardPoints  int          default 0                 null comment '奖励积分',
    invitationCode     varchar(255)                           null comment '邀请码',
    VIPExpirationTime  datetime                               null comment 'VIP的过期时间',
    SVIPExpirationTime datetime                               null comment 'SVIP的过期时间'
)
    comment '用户' collate = utf8mb4_unicode_ci;
INSERT INTO `user` (`id`, `userAccount`, `userPassword`, `userName`, `email`, `userAvatar`, `createTime`, `updateTime`, `isDelete`, `userRole`, `totalRewardPoints`, `invitationCode`, `VIPExpirationTime`, `SVIPExpirationTime`) VALUES (1697633200786403330, 'goat', 'b0dd3697a192885d7c055db46155b26a', 'goat', NULL, 'https://hwq-1317946928.cos.ap-shanghai.myqcloud.com/user_avatar/1697633200786403330/68Wl983t-20191209062144363.jpg', '2023-09-01 23:31:10', '2023-10-23 21:47:59', 0, 'admin', 1652, '1LtNFlOG', NULL, NULL);
INSERT INTO `user` (`id`, `userAccount`, `userPassword`, `userName`, `email`, `userAvatar`, `createTime`, `updateTime`, `isDelete`, `userRole`, `totalRewardPoints`, `invitationCode`, `VIPExpirationTime`, `SVIPExpirationTime`) VALUES (1705187795989446657, 'yupi', 'b0dd3697a192885d7c055db46155b26a', 'yupi', NULL, 'https://tse2-mm.cn.bing.net/th/id/OIP-C.GcH5tncpMBmeWkfM0SkTfwHaHa?pid=ImgDet&rs=1', '2023-09-22 19:50:26', '2023-10-23 23:54:19', 0, 'vip', 551, '9LtNFlOG', '2023-11-22 23:54:19', NULL);
INSERT INTO `user` (`id`, `userAccount`, `userPassword`, `userName`, `email`, `userAvatar`, `createTime`, `updateTime`, `isDelete`, `userRole`, `totalRewardPoints`, `invitationCode`, `VIPExpirationTime`, `SVIPExpirationTime`) VALUES (1711226458418520066, 'huang', 'b0dd3697a192885d7c055db46155b26a', 'huang', NULL, 'https://tse2-mm.cn.bing.net/th/id/OIP-C.GcH5tncpMBmeWkfM0SkTfwHaHa?pid=ImgDet&rs=1', '2023-10-09 11:45:55', '2023-10-23 23:46:02', 0, 'vip', 757, '8LtNFlOG', NULL, NULL);
INSERT INTO `user` (`id`, `userAccount`, `userPassword`, `userName`, `email`, `userAvatar`, `createTime`, `updateTime`, `isDelete`, `userRole`, `totalRewardPoints`, `invitationCode`, `VIPExpirationTime`, `SVIPExpirationTime`) VALUES (1711350501649948674, 'wenqing', 'b0dd3697a192885d7c055db46155b26a', 'wenqing', '1602370456@qq.com', 'https://tse2-mm.cn.bing.net/th/id/OIP-C.GcH5tncpMBmeWkfM0SkTfwHaHa?pid=ImgDet&rs=1', '2023-10-09 19:58:49', '2023-10-12 01:03:08', 0, 'user', 551, '7LtNFlOG', NULL, NULL);


create index idx_userAccount
    on bi.user (userAccount);

create table if not exists bi.user_create_assistant
(
    id            bigint                                  not null
        primary key,
    assistantName varchar(255)  default ''                null comment '助手名称',
    userId        bigint                                  not null comment '创建人Id',
    type          varchar(255)                            null comment '助手类型',
    historyTalk   tinyint(1)    default 0                 null comment '历史对话',
    functionDes   varchar(2048) default ''                null comment '功能描述',
    inputModel    varchar(2048) default ''                null comment '输入模型',
    roleDesign    varchar(2048)                           null comment '角色设定',
    targetWork    varchar(2048) default ''                null comment '目标任务',
    requirement   varchar(2048) default ''                null comment '需求说明',
    style         varchar(255)  default ''                null comment '风格设定',
    otherRequire  varchar(2048) default ''                null comment '其它示例',
    isOnline      tinyint(1)    default 0                 null comment '是否上线',
    createTime    datetime      default CURRENT_TIMESTAMP not null comment '创建时间',
    updateTime    datetime      default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '更新时间',
    isDelete      tinyint       default 0                 not null comment '是否删除'
)
    comment '用户创建的助手';
INSERT INTO `user_create_assistant` (`id`, `assistantName`, `userId`, `type`, `historyTalk`, `functionDes`, `inputModel`, `roleDesign`, `targetWork`, `requirement`, `style`, `otherRequire`, `isOnline`, `createTime`, `updateTime`, `isDelete`) VALUES (1710640314391814145, '饮食专家', 1697633200786403330, '健康', 1, '给出饮食建议', '给出饮食建议', '你是一名营养师', '给出健康的饮食建议', '建议简介明了', '', '', 0, '2023-10-07 20:56:47', '2023-10-07 20:56:47', 0);
INSERT INTO `user_create_assistant` (`id`, `assistantName`, `userId`, `type`, `historyTalk`, `functionDes`, `inputModel`, `roleDesign`, `targetWork`, `requirement`, `style`, `otherRequire`, `isOnline`, `createTime`, `updateTime`, `isDelete`) VALUES (1710903554896138242, 'Hadoop专家', 1697633200786403330, '编程', 0, '解决Hadoop方面的问题', '比如：Hdfs的原理？你能为我解答', '你是一名大数据方面的专家', '解决Hadoop方面的问题', '要求给出的解决方案简洁明了', '简介', '', 0, '2023-10-08 14:22:49', '2023-10-08 14:22:49', 0);
INSERT INTO `user_create_assistant` (`id`, `assistantName`, `userId`, `type`, `historyTalk`, `functionDes`, `inputModel`, `roleDesign`, `targetWork`, `requirement`, `style`, `otherRequire`, `isOnline`, `createTime`, `updateTime`, `isDelete`) VALUES (1711227464141316098, 'Hadoop专家', 1711226458418520066, '编程', 0, '解决hadoop相关问题', '给我hadoop解决方案', '你是一名大数据方面的专家', '解决Hadoop方面的问题', '解决Hadoop方面的问题', '简洁明了', '', 0, '2023-10-09 11:49:55', '2023-10-09 11:49:55', 0);
INSERT INTO `user_create_assistant` (`id`, `assistantName`, `userId`, `type`, `historyTalk`, `functionDes`, `inputModel`, `roleDesign`, `targetWork`, `requirement`, `style`, `otherRequire`, `isOnline`, `createTime`, `updateTime`, `isDelete`) VALUES (1711230276627607553, '饮食专家', 1711226458418520066, '健康', 1, '给出健康饮食建议', '怎么吃更健康？', '你是一名营养师', '给出健康的饮食建议', '给出健康的饮食建议', '简洁明了', '', 0, '2023-10-09 12:01:05', '2023-10-09 12:01:05', 0);
INSERT INTO `user_create_assistant` (`id`, `assistantName`, `userId`, `type`, `historyTalk`, `functionDes`, `inputModel`, `roleDesign`, `targetWork`, `requirement`, `style`, `otherRequire`, `isOnline`, `createTime`, `updateTime`, `isDelete`) VALUES (1716292966333124609, '智能助手', 1711226458418520066, '其它', 0, '无', '无', '你是一名智能助手', '', '', '', '', 0, '2023-10-23 11:18:25', '2023-10-23 11:18:25', 0);


create table if not exists bi.user_message
(
    id          bigint                                  not null comment '消息id'
        primary key,
    userId      bigint                                  not null,
    description varchar(1024) default ''                null comment '内容',
    type        tinyint       default 0                 null comment '0-普通 1-成功 2-失败',
    title       varchar(255)  default ''                null comment '消息标题',
    createTime  datetime      default CURRENT_TIMESTAMP null,
    updateTime  datetime      default CURRENT_TIMESTAMP null,
    isDelete    tinyint       default 0                 null,
    isRead      tinyint(1)    default 0                 null comment '0 -未读 1-已读',
    route       varchar(255)  default ''                null comment '消息对应跳转的路由'
);
INSERT INTO `user_message` (`id`, `userId`, `description`, `type`, `title`, `createTime`, `updateTime`, `isDelete`, `isRead`, `route`) VALUES (1706144997113909249, 1697633200786403330, 'Hello', 0, 'Hello', '2023-09-25 11:14:00', '2023-09-25 11:14:00', 0, 1, '');
INSERT INTO `user_message` (`id`, `userId`, `description`, `type`, `title`, `createTime`, `updateTime`, `isDelete`, `isRead`, `route`) VALUES (1706150113460146178, 1697633200786403330, '已生成图表', 0, '点击查看', '2023-09-25 11:34:20', '2023-09-25 11:34:20', 0, 1, '');
INSERT INTO `user_message` (`id`, `userId`, `description`, `type`, `title`, `createTime`, `updateTime`, `isDelete`, `isRead`, `route`) VALUES (1706150235493421057, 1697633200786403330, '点击查看', 0, '已生成图表', '2023-09-25 11:34:49', '2023-09-25 11:34:49', 0, 1, '');
INSERT INTO `user_message` (`id`, `userId`, `description`, `type`, `title`, `createTime`, `updateTime`, `isDelete`, `isRead`, `route`) VALUES (1706160084339945474, 1697633200786403330, '点击查看详情', 1, '分析图表已生成', '2023-09-25 12:13:57', '2023-09-25 12:13:57', 0, 1, '/chart_detail/1706160036722012161');
INSERT INTO `user_message` (`id`, `userId`, `description`, `type`, `title`, `createTime`, `updateTime`, `isDelete`, `isRead`, `route`) VALUES (1706160743630008321, 1697633200786403330, '点击查看详情', 1, '分析图表已生成', '2023-09-25 12:16:34', '2023-09-25 12:16:34', 0, 1, '/chart_detail/1706160699489153026');
INSERT INTO `user_message` (`id`, `userId`, `description`, `type`, `title`, `createTime`, `updateTime`, `isDelete`, `isRead`, `route`) VALUES (1706161264084414465, 1697633200786403330, '点击查看详情', 1, '分析图表已生成', '2023-09-25 12:18:38', '2023-09-25 12:18:38', 0, 1, '/chart_detail/1706161202189070338');
INSERT INTO `user_message` (`id`, `userId`, `description`, `type`, `title`, `createTime`, `updateTime`, `isDelete`, `isRead`, `route`) VALUES (1706162447691853826, 1697633200786403330, '点击查看详情', 1, '分析图表已生成', '2023-09-25 12:23:21', '2023-09-25 12:23:21', 0, 1, '/chart_detail/1706162394738765826');
INSERT INTO `user_message` (`id`, `userId`, `description`, `type`, `title`, `createTime`, `updateTime`, `isDelete`, `isRead`, `route`) VALUES (1706166880521752577, 1697633200786403330, '点击查看详情', 1, '分析图表已生成', '2023-09-25 12:40:58', '2023-09-25 12:40:58', 0, 1, '/chart_detail/1706166833251946498');
INSERT INTO `user_message` (`id`, `userId`, `description`, `type`, `title`, `createTime`, `updateTime`, `isDelete`, `isRead`, `route`) VALUES (1706171269164634114, 1697633200786403330, '点击查看详情', 1, '分析图表已生成', '2023-09-25 12:58:24', '2023-09-25 12:58:24', 0, 1, '/chart_detail/1706171118689783810');
INSERT INTO `user_message` (`id`, `userId`, `description`, `type`, `title`, `createTime`, `updateTime`, `isDelete`, `isRead`, `route`) VALUES (1706171425868025858, 1697633200786403330, '点击查看详情', 1, '分析图表已生成', '2023-09-25 12:59:01', '2023-09-25 12:59:01', 0, 1, '/chart_detail/1706171348625723394');
INSERT INTO `user_message` (`id`, `userId`, `description`, `type`, `title`, `createTime`, `updateTime`, `isDelete`, `isRead`, `route`) VALUES (1706173110564753410, 1697633200786403330, '点击查看详情', 1, '分析图表已生成', '2023-09-25 13:05:43', '2023-09-25 13:05:43', 0, 1, '/chart_detail/1706173010874535938');
INSERT INTO `user_message` (`id`, `userId`, `description`, `type`, `title`, `createTime`, `updateTime`, `isDelete`, `isRead`, `route`) VALUES (1706174337532891138, 1697633200786403330, '点击查看详情', 1, '分析图表已生成', '2023-09-25 13:10:35', '2023-09-25 13:10:35', 0, 1, '/chart_detail/1706174281467629570');
INSERT INTO `user_message` (`id`, `userId`, `description`, `type`, `title`, `createTime`, `updateTime`, `isDelete`, `isRead`, `route`) VALUES (1706174609948741633, 1697633200786403330, '点击查看详情', 1, '分析图表已生成', '2023-09-25 13:11:40', '2023-09-25 13:11:40', 0, 1, '/chart_detail/1706174558203613185');
INSERT INTO `user_message` (`id`, `userId`, `description`, `type`, `title`, `createTime`, `updateTime`, `isDelete`, `isRead`, `route`) VALUES (1706233549319340033, 1697633200786403330, '点击查看详情', 1, '分析图表已生成', '2023-09-25 17:05:53', '2023-09-25 17:05:53', 0, 1, '/chart_detail/1706233473385660417');
INSERT INTO `user_message` (`id`, `userId`, `description`, `type`, `title`, `createTime`, `updateTime`, `isDelete`, `isRead`, `route`) VALUES (1706563714360655874, 1697633200786403330, '点击查看详情', 1, '分析图表已生成', '2023-09-26 14:57:50', '2023-09-26 14:57:50', 0, 1, '/chart_detail/1706563629606354945');
INSERT INTO `user_message` (`id`, `userId`, `description`, `type`, `title`, `createTime`, `updateTime`, `isDelete`, `isRead`, `route`) VALUES (1706564096025542658, 1697633200786403330, '点击查看详情', 1, '分析图表已生成', '2023-09-26 14:59:21', '2023-09-26 14:59:21', 0, 1, '/chart_detail/1706564015125807105');
INSERT INTO `user_message` (`id`, `userId`, `description`, `type`, `title`, `createTime`, `updateTime`, `isDelete`, `isRead`, `route`) VALUES (1706660044957405185, 1697633200786403330, '点击查看详情', 1, '分析图表已生成', '2023-09-26 21:20:37', '2023-09-26 21:20:37', 0, 1, '/chart_detail/1706659982302892033');
INSERT INTO `user_message` (`id`, `userId`, `description`, `type`, `title`, `createTime`, `updateTime`, `isDelete`, `isRead`, `route`) VALUES (1706660394670084098, 1697633200786403330, '点击查看详情', 1, '分析图表已生成', '2023-09-26 21:22:00', '2023-09-26 21:22:00', 0, 1, '/chart_detail/1706660321538199553');
INSERT INTO `user_message` (`id`, `userId`, `description`, `type`, `title`, `createTime`, `updateTime`, `isDelete`, `isRead`, `route`) VALUES (1706663707876614146, 1697633200786403330, '点击查看详情', 1, '分析图表已生成', '2023-09-26 21:35:10', '2023-09-26 21:35:10', 0, 1, '/chart_detail/1706663556609040385');
INSERT INTO `user_message` (`id`, `userId`, `description`, `type`, `title`, `createTime`, `updateTime`, `isDelete`, `isRead`, `route`) VALUES (1707739712804483073, 1697633200786403330, '点击查看详情', 1, '分析图表已生成', '2023-09-29 20:50:50', '2023-09-29 20:50:50', 0, 1, '/chart_detail/1707739629790818306');
INSERT INTO `user_message` (`id`, `userId`, `description`, `type`, `title`, `createTime`, `updateTime`, `isDelete`, `isRead`, `route`) VALUES (1710630645166280705, 1697633200786403330, '点击查看详情', 1, '分析图表已生成', '2023-10-07 20:18:22', '2023-10-07 20:18:22', 0, 1, '/chart_detail/1710630346942877697');
INSERT INTO `user_message` (`id`, `userId`, `description`, `type`, `title`, `createTime`, `updateTime`, `isDelete`, `isRead`, `route`) VALUES (1711356088576122882, 1711350501649948674, '点击查看详情', 1, '分析图表已生成', '2023-10-09 20:21:01', '2023-10-09 20:21:01', 0, 1, '/chart_detail/1711355882224754690');

create table user_data
(
    id              bigint auto_increment
        primary key,
    userId          bigint                                 not null comment '创建数据用户',
    createTime      datetime     default CURRENT_TIMESTAMP null,
    updateTime      datetime     default CURRENT_TIMESTAMP null,
    isDelete        tinyint      default 0                 null,
    dataName        varchar(255) default '数据集'           null comment '数据集名称',
    fieldTypeInfo   text                                   null comment '字段类型',
    description     varchar(512) default ''                null comment '数据集描述',
    uploadType      tinyint      default 0                 null comment '上传类型',
    totalRecord     int          default 0                 null comment '记录数',
    readSecretKey   varchar(255)                           null comment '读密钥',
    writeSecretKey  varchar(255)                           null comment '写密钥',
    approvalConfirm tinyint(1)   default 0                 not null comment '审批确认'
);


create table user_data_permission (
    id bigint primary key auto_increment,
    dataId bigint not null comment '对应数据集id',
    userId bigint not null comment '对应用户id',
    permission tinyint default 0 comment '权限',
    createTime  datetime      default CURRENT_TIMESTAMP null,
    updateTime  datetime      default CURRENT_TIMESTAMP null,
    isDelete    tinyint       default 0                 null
);



# 用户数据库元数据
drop table if exists bi.datasource_meta_info;
create table bi.datasource_meta_info (
    id bigint primary key auto_increment,
    userId bigint not null comment '创建人id',
    name varchar(255) not null default '未命名数据源' comment '数据源名称',
    description varchar(512) null comment '数据源描述',
    type tinyint null default 0 comment '数据源类型',
    host varchar(40) not null comment '主机地址',
    port varchar(16) not null comment '端口号',
    dataBaseName varchar(100) not null comment '数据库名称',
    userName varchar(100) not null comment '用户名',
    password varchar(255) not null comment '密码',
    initConNum tinyint null default 5 comment '初始连接数',
    maxConNum tinyint null default 10 comment '最大连接数',
    timeoutSecond int null default 10 comment '连接超时时间',
    createTime  datetime      default CURRENT_TIMESTAMP null,
    updateTime  datetime      default CURRENT_TIMESTAMP null,
    isDelete    tinyint       default 0                 null
);

-- 数据源信息
DROP TABLE if exists core_datasource;
create table core_datasource
(
    id               bigint auto_increment comment '主键' primary key,
    name             varchar(255)      not null comment '名称',
    description      varchar(255)      null comment '描述',
    type             varchar(50)       not null comment '类型',
    pid              bigint            null comment '父级ID --文件夹',
    editType         varchar(50)       null comment '更新方式：0：替换；1：追加',
    configuration    longtext          not null comment '详细信息',
    status           longtext          null comment '状态',
    taskStatus      varchar(50)       null comment '任务状态',
    enableDataFill tinyint default 0  null comment '启用数据填报功能 0-不填报 1-填报',
    userId           bigint            not null comment '创建的用户ID',
    createTime      datetime           null default CURRENT_TIMESTAMP comment '创建时间',
    updateTime      datetime           null default CURRENT_TIMESTAMP comment '更新时间',
    isDelete        tinyint            default 0  null comment '逻辑删除'
) comment '数据源表';

-- 数据源目录树
DROP TABLE if exists datasource_dir_tree;
create table datasource_dir_tree
(
    id               bigint auto_increment comment '主键' primary key,
    name             varchar(255)      not null comment '名称',
    type             varchar(50)       not null comment '类型 dir（目录）、file（文件）',
    pid              bigint            null comment '父级ID --文件夹',
    wight           int                not null default 0,
    userId           bigint            not null comment '创建的用户ID',
    datasourceId     bigint            null comment '数据源id',
    createTime      datetime           null default CURRENT_TIMESTAMP comment '创建时间',
    updateTime      datetime           null default CURRENT_TIMESTAMP comment '更新时间',
    isDelete        tinyint            default 0  null comment '逻辑删除'
) comment '数据源目录树';
-- 插入根节点
insert into datasource_dir_tree(id, name, type, pid, wight, userId) values (0, '数据源', 'dir', 0, 1, 1697633200786403330);


-- 优惠券模版
drop table if exists coupon_template;
create table coupon_template(
    `id`			bigint(20)		PRIMARY KEY AUTO_INCREMENT COMMENT 'ID',
    `name`		    varchar(256)	DEFAULT NULL COMMENT '优惠券名称',
    `description`	text			DEFAULT NULL COMMENT '描述',
    `type`			tinyint(1)		DEFAULT NULL COMMENT '类型',
    `validStartTime` datetime		DEFAULT NULL COMMENT '有效期开始时间',
    `validEndTime`   datetime		DEFAULT NULL COMMENT '有效期截止时间',
    `stock`			int(11)			DEFAULT NULL COMMENT '优惠券发行量',
    `claimRules`	json			DEFAULT NULL COMMENT	'领取规则',
    `usageRules`	json			DEFAULT NULL COMMENT	'使用规则',
    `status`	    tinyint(1)		DEFAULT 0 COMMENT	'0-使用中 1-正常下线',
    createTime      datetime           null default CURRENT_TIMESTAMP comment '创建时间',
    updateTime      datetime           null default CURRENT_TIMESTAMP comment '更新时间',
    isDelete        tinyint            default 0  null comment '逻辑删除'
);

DROP TABLE if exists coupon_task;
CREATE TABLE `coupon_task`
(
    `id`                 bigint(20) PRIMARY KEY AUTO_INCREMENT COMMENT 'ID',
    `batchId`           bigint(20) DEFAULT NULL COMMENT '批次ID',
    `taskName`          varchar(128) DEFAULT NULL COMMENT '优惠券批次任务名称',
    `sendNum`           int(11) DEFAULT NULL COMMENT '发放优惠券数量',
    `userListFilePath`  varchar(255) DEFAULT NULL COMMENT '发放用户列表文件地址',
    `notifyType`        varchar(32)  DEFAULT NULL COMMENT '通知方式，可组合使用 0：站内信 1：弹框推送 2：邮箱 3：短信',
    `couponTemplateId` bigint(20) DEFAULT NULL COMMENT '优惠券模板ID',
    `sendType`          tinyint(1) DEFAULT NULL COMMENT '发送类型 0：立即发送 1：定时发送',
    `sendTime`          datetime     DEFAULT NULL COMMENT '发送时间',
    `status`             tinyint(1) DEFAULT NULL COMMENT '状态 0：待执行 1：执行中 2：执行失败 3：执行成功 4：取消',
    `completionTime`    datetime     DEFAULT NULL COMMENT '完成时间',
    `operatorId`        bigint(20) DEFAULT NULL COMMENT '操作人 -- 管理源id',
    createTime      datetime           null default CURRENT_TIMESTAMP comment '创建时间',
    updateTime      datetime           null default CURRENT_TIMESTAMP comment '更新时间',
    isDelete        tinyint            default 0  null comment '逻辑删除',
    KEY                  `idx_batch_id` (`batchId`) USING BTREE,
    KEY                  `idx_coupon_template_id` (`couponTemplateId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1816362696870739971 DEFAULT CHARSET=utf8mb4 COMMENT='优惠券模板发送任务表';


-- 发放优惠券失败记录
DROP TABLE if exists coupon_task_fail_record;
CREATE TABLE `coupon_task_fail_record`
(
    `id`          bigint(20) PRIMARY KEY AUTO_INCREMENT COMMENT 'ID',
    `batchId`    bigint(20) NOT NULL COMMENT '批次ID',
    `userId`     bigint(20) NOT NULL COMMENT '用户ID',
    `couponTemplateId` bigint(20) DEFAULT NULL COMMENT '优惠券模板ID',
    `failedContent` text COMMENT '失败内容',
    createTime      datetime           null default CURRENT_TIMESTAMP comment '创建时间',
    updateTime      datetime           null default CURRENT_TIMESTAMP comment '更新时间',
    `operatorId`        bigint(20) DEFAULT NULL COMMENT '操作人 -- 管理源id',
    isDelete        tinyint            default 0  null comment '逻辑删除'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='优惠券发放任务失败详情表';


DROP TABLE if exists user_coupon;
CREATE TABLE `user_coupon`
(
    `id`                 bigint(20) PRIMARY KEY AUTO_INCREMENT COMMENT 'ID',
    `userId`            bigint(20) DEFAULT NULL COMMENT '用户ID',
    `couponTemplateId` bigint(20) DEFAULT NULL COMMENT '优惠券模板ID',
    `receiveTime`       datetime DEFAULT NULL COMMENT '领取时间',
    `receiveCount`      int(3) DEFAULT NULL COMMENT '领取次数',
    `validStartTime`   datetime DEFAULT NULL COMMENT '有效期开始时间',
    `validEndTime`     datetime DEFAULT NULL COMMENT '有效期结束时间',
    `useTime`           datetime DEFAULT NULL COMMENT '使用时间',
    `source`             tinyint(1) DEFAULT NULL COMMENT '券来源 0：领券中心 1：平台发放 2：店铺领取',
    `status`             tinyint(1) DEFAULT NULL COMMENT '状态 0：未使用 1：锁定 2：已使用 3：已过期 4：已撤回',
    createTime      datetime           null default CURRENT_TIMESTAMP comment '创建时间',
    updateTime      datetime           null default CURRENT_TIMESTAMP comment '更新时间',
    isDelete        tinyint            default 0  null comment '逻辑删除',
    UNIQUE KEY `idx_user_id_coupon_template_receive_count` (`userId`,`couponTemplateId`,`receiveCount`) USING BTREE,
    KEY                  `idx_user_id` (`userId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1816074493920030734 DEFAULT CHARSET=utf8mb4 COMMENT='用户优惠券表';