### flutter项目脚手架

**## flutter医护端开发文档**

**##### 文件名统一使用下划线方式命名,类名、方法名、变量名统一使用小驼峰命名法！！！**

**##### 文件名统一使用下划线方式命名,类名、方法名、变量名统一使用小驼峰命名法！！！**

**##### 文件名统一使用下划线方式命名,类名、方法名、变量名统一使用小驼峰命名法！！！**

脚手架项目内置了：

1.基于`dio`二次封装符合业务需求的`http` 网络请求库。

2.基于`getx`和`pull_to_refresh`封装的网络请求`ui`框架，自带下拉刷新，下拉加载更多、点击重试等功能,

监听`app`前后台切换事件，包含空数据、网络异常、正常返回等状态（不同状态`可自定义`）。

3.基于`getx`的状态管理、路由管理、主题管理、国际化（多语言处理）等功能。

4.集成`flutter_ume`开发调试工具，方便`debug`和`ui`调整。

5.集成`flustars`,封装了常用的工具类函数,包含`jsonUtils`、`logUtil`、`textUtil`、`dateUtil`、`numUtil`等，开箱即用。

6.集成`package_info`、`device_info`等业务插件。

7.`app`多环境切换功能，区分开发、测试、生产等环境。

8.对`app`通用业务进行了封装和初始化。

9.基于`flutter_xupdate`实现`android`应用内更新

**### 项目整体架构**

```
lib 
​    -base   项目网络请求ui框架封装
​        \- BaseFutureLoadStateController 网络请求controller父类，定义了加载数据，管理页面状态，监听app前后台切换，与FutureLoadStateBuilder搭配使用
​        \- PullToRefreshLoadStateController 继承自BaseFutureLoadStateController,扩展了下拉刷新加载更多的功能，与PullToRefreshStateBuilder搭配使用
​    -components 通用的业务组件封装
​    -config 项目配置
​        -initializer 初始化器 对于app的初始化工作在这里完成（比如三方库、sdk的初始化）
​        -app_config.dart 定义app环境
​    -http 网络请求框架封装
​    -meta 自定义注解(某个功能需要优化使用@ToBeOptimized标注，某个字段需要验证使用@validate标注)
​    -page 页面相关
​    -R 定义所有资源文件，统一通过R.方式进行引用
​    -router 路由管理
​        \- middleware 路由中间件
​        \- routes.dart 定义页面路径
​        \- router.dart 路径与页面关联
​    -service 所有的业务请求
​        -entity 定义model类，model类按照页面、功能分类放在不同目录下
​        -*_api.dart 定义某一类业务相关的api
​    -storage 本地存储相关，share_preferecend二次封装
​    -theme 对颜色、字体、主题的定义
​    -utils 常用工具类函数
​    -main.dart app 生产环境程序入口
​    -main_test.dart app测试环境入口
​    -sandbox.dart 环境无关的app入口
```

**#### http网络请求框架**

```
http
​    -adaptor 对不同网络请求库的适配器
​    -code  定义业务code，通过定义枚举类，对不同业务状态码进行区分。
​    -exception 网络异常相关（网络异常分为两种，一种是http异常、一种是api业务异常）
​    -interceptor 业务相关拦截器
​    -proxy 网络代理相关配置
​    -request 请求相关
​        -api_request.dart api请求发送的实体类
​    -response 响应相关
​        -api_response.dart api响应的是实体类
​    -http.dart get post等网络请求方法的实体类
```

**#### page相关**

```
page
​    -*_binding.dart 将controller和页面关联
​    -*_controller.dart 处理页面中的url
​    -*_page.dart 页面 dialog modal 全部放在page文件中
```

**### 开发说明及注意事项**

1.在网络发生过程中的网络异常已经在`http`的`get`、`post`、`put`等方法中已经捕获，在`*_api.dart`文件中无需在进行异常拦截或进行`try catch`操作。

2.在`*_api.dart`文件中只返回`*_controller.dart`中需要的数据，如果数据不符合`*_controller.dart`中则在`*_api.dart`中进行处理和转换。

3.在`*_controller.dart`文件中，如果方法不对`*_page.dart`暴露，则尽量声明为私有（以下划线开头）。

4.在网络请求中debug调试时，出现断点进不去时，优先考虑服务端返回的数据是否符合预期，在查看`Future.then`方法中的返回值是否符合预期。

5.在命名方面尽量保持风格统一。

6.在接入`webview`时需要注意以下事项：

   6.1 `js`代码统一写在三引号中,无论代码量多少(`"""""""`);

   6.2 `flutter`和`js`通信出现问题时，首先排查`channel`名字是否正确。有时`ios`和`android`两侧的`channel`名称不一致。

**### 开发环境区分**

在开发环境切换方面有多种形式。在这里为了简单和简单，只需要修改`sanbox`函数里面的`env` 参数即可。



