
# MV(X)

+ Models -- 域数据 或 操作数据的数据访问层 (domain data or a data access layer which manipulates the data)

+ Views -- 表现层 (presentation layer)

+ **Controller**/Presenter/ViewModel -- Model 与 View 之间的 黏合剂 或 中介, 通常响应用户在 View 上的操作改变 Model 并更新 View (the glue or the mediator between the Model and the View, in general, altering the Model by reacting to the user's actions performed on the View and updating the View with changes from the Model)

## Traditional MVC

[MSDN MVC](https://docs.microsoft.com/en-us/previous-versions/msp-n-p/ff649643(v=pandp.10))

![传统MVC](https://img-blog.csdn.net/20151216120808604)

传统 MVC 中, View 是无状态的, 一旦 Model 改变就会被 Controller 简单渲染 (It is simply rendered by Controller once the Model is changed)

**Model View Controller 紧紧耦合在一起, 每个实体都知道另外两个, 大大降低复用性 (all three entities are tightly coupled, each entity knows about the other two)**

## Apple's MVC

![Apple's MVC](https://img-blog.csdn.net/20151216120942714)

Controller 是 View 和 Model 的中介, 因此 View 和 Model 不需要知道对方

Controller 的复用性最低, 因为必需有处理不适合放在 Model 中的复杂业务逻辑的地方 (The least reusable is the Controller and this is usually fine for us, since we must have a place for all that ticky business logic that doesn't fit into the Model)

![Reality Apple's MVC](https://img-blog.csdn.net/20151216141217806)

Cocoa MVC 鼓励写出 Massive ViewController, 因为 ViewController 参与到 View 的生命周期很难使其分开

虽然能使部分业务逻辑和数据转换放到 Model, 但对更新 View 没有太多选择, 大部分时间 View 的职责是传递 action 到 Controller (Although you still have ability to offload some of the business logic and data transformation to the Model, you don't have much choice when it comes to offloading work to View, at most of times all responsibility of the View is to send actions to the Controller)

最后 ViewController 沦为所有东西的 delegate 和 data source, 而且通常会负责调用和取消网络请求等...

+ 布局 (Distribution) -- View 和 Model 分离, 但 View 和 Controller 紧密耦合
+ 可测性 -- 只能测试 Model
+ 易用性 -- 对比其他模式代码量少, 大众比较熟悉, 即使没什么经验的开发者也能容易维护

## MVP

[MSDN MVP](https://docs.microsoft.com/en-us/previous-versions/msp-n-p/ff649571(v=pandp.10))

![MVP](https://img-blog.csdn.net/20151216141519450)

**与 Apple's MVC 区别为 Presenter 只是 Mediator, 没有和 View 的生命周期紧密耦合**

**MVP 揭示了由于具有 3 个实际分离层而出现的组装问题**
**可以通过 app-wide 路由服务来负责执行组装及 View-to-View 展示**

+ 布局 (Distribution) -- 分离的 Presenter Model 和 dump View
+ 可测性 -- 可测大部分业务逻辑
+ 易用性 -- 代码量比 MVC 多, 但同时思路十分清晰

## MVVM

[MSDN MVVM](https://docs.microsoft.com/en-us/previous-versions/msp-n-p/hh848246(v=pandp.10)#MVVMPattern)

![MVVM](https://img-blog.csdn.net/20151216142000760)

**对比 MVP, MVVM 的 View 与 ViewModel 绑定**

**View 独立表示 (包括 View 的状态)**

**ViewModel 调用改变 Model 并更新自己, 由于 View 与 ViewModel 的绑定, 因此 View 也随之改变**

***Binding***

**由于 iOS 没有 binding 工具, 因此一般以以下形式实现**

+ 基于 KVO 实现的 RZDataBinding 或 SwiftBond
+ 响应式编程框架 RxSwift, PromiseKit, ReactiveCocoa
+ KVO

**一点痛苦的现实: 响应式伴随着出问题的时候 debug 的困难**

+ 布局 (Distribution) -- MVVM 的 View 相对 MVP 有更多职责 ***(需要初始化数据并绑定 ViewModel)***
+ 可测性 -- ViewModel 不知道 View, 因此 ViewModel 容易测试, 基于 UIKit 的 View 也容易测试
+ 易用性 -- 代码量大, 如果使用绑定, 会减少很多