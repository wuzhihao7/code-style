# 编码约定

## 前言

工欲善其事必先利其器

使用google编码规约（主要是google提供了一系列插件，可以通过自动化检测代码规范）

期待大家把开发过程中遇到的坑点提出来，一起致力于搭建友好的开发环境

## 源文件编码
强制使用UTF-8
## 换行符
强制使用LF(\n)
## maven构建

1. 使用toolchains管理jdk版本

将config/toolchains.xml文件放到maven_home目录下，调整相应jdk安装路径即可，具体参考[maven-toolchains-plugin](https://maven.apache.org/plugins/maven-toolchains-plugin/usage.html)

## 脚本

| init.sh/init.bat   | 将pre-commit文件拷贝到当前项目的.git/hooks中，用于commit前检查代码规范 |
| ------------------ | ------------------------------------------------------------ |
| build.sh/build.bat | 打包脚本，可以传入参数指定构建配置组，默认dev，可根据需要在pom.xml中添加修改 |

建议本地安装git shell，基本可以满足日常开发使用

## 代码仓库

1. 使用.gitignore文件忽略与源码无关的版本控制
2. 使用.gitattributes强制提交时换行符转换为LF
3. 使用git hook检查代码规范(执行init脚本导入pre-commit)

## 关于分包

1. 统一包前缀：`com.ysepay.clearing` or  `com.eptok.clearing`

感觉`com.ysepay.clearing`和银盛支付更接近，其中`settle`代表清算组，在这之后可以按清算组业务条线新增子包，比如：check(对账)、settle(结算)、division(分账)...英文是翻译过来的，有更专业的更好

2. 分包规则：原来的分包规则是直接按分层架构分包，代码量增大以后，会出现一个包下全是各种dao、service，阅读代码比较不友好，更好的分包规则是基于业务模块或者功能模块进行分包，这样分包后，代码更加自明，通过这样的分包规则可以在查阅代码的时候更加高效，同时有助于理解代码

分包规则相关可以参考：[模式包结构](https://www.cnkirito.moe/Re-DDD)

## 关于依赖

原来的public，把很多dubbo接口无关的组件都暴露出去了，这么做其实会无形增加应用之间的耦合。本着最小依赖原则，建议对外暴露的依赖越少越好。

## 统一异常类

可以定义清算组的顶层异常类，然后其他自定义异常都继承于改异常类。

这样做以后可以在dubbo端做一个filter，统一异常处理，所有接口都抛出这个顶层的异常类，可以避免dubbo重新包装异常

## 分布式调用链路跟踪

使用requestid贯穿整个调用链路，便于日志定位分析排查问题

## 关于IDE

强烈推荐Intellij Idea，上手以后你会发现真香，附上相关教程[idea](https://blog.csdn.net/qq_35246620/article/details/61191375)

当然也可以选择其他的：eclipse、netbean、vscode等

## 单元测试

...

## 参考链接
[spotless-maven-plugin](https://github.com/diffplug/spotless/tree/main/plugin-maven#line-endings-and-encodings-invisible-stuff)
[styleguide](https://github.com/google/styleguide)
[google-java-format](https://github.com/google/google-java-format)
[code-style](https://insights.thoughtworks.cn/save-java-code-style-obsessive-compulsive-disorder)