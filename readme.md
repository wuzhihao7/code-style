# 编码约定
## 源文件编码
强制使用UTF-8
## 换行符
强制使用LF(\n)
## 代码仓库
1. 使用.gitignore文件忽略与源码无关的版本控制
2. 使用.gitattributes强制提交时换行符转换为LF
3. 使用git hook检查代码规范(执行init脚本导入pre-commit)
## 参考链接
[spotless-maven-plugin](https://github.com/diffplug/spotless/tree/main/plugin-maven#line-endings-and-encodings-invisible-stuff)
[styleguide](https://github.com/google/styleguide)
[google-java-format](https://github.com/google/google-java-format)
[code-style](https://insights.thoughtworks.cn/save-java-code-style-obsessive-compulsive-disorder)