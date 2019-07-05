
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

# VIPER

[VIPER 原文](https://www.objc.io/issues/13-architecture/viper/)

![VIPER](https://img-blog.csdn.net/20151216142629480)

![VIPER](https://www.objc.io/images/issue-13/2014-06-07-viper-intro-0a53d9f8.jpg)

![VIPER](https://www.objc.io/images/issue-13/2014-06-07-viper-wireframe-76305b6d.png)

**VIPER 的分层提供清晰的位置来处理程序逻辑和导航相关代码**

***基于用例设计程序***

如何把复杂 app 分解为小的用例是个挑战并需要练习, 但这样能有效限制每个问题的范围和每个 class (It's a helpful way to limit the scope of each problem you are solving and each class that you are writing)

用例也会影响 user interface, 而且必需考虑如何把用例与其他核心组件配合使用, 如 **网络** 与 **数据持久** (networking and data persistence)

组件就像用例的插件, 而 VIPER 就是描述各个组件的作用和组件间如何相互作用 的方式

+ View -- 根据 Presenter 指示进行显示, 并响应用户输入到 Presenter

+ Interactor -- 包含用例指定的业务逻辑

+ Presentor -- 包含 用于准备显示内容的视图逻辑 (view logic for preparing content for display) 及 响应用户输入 (by requesting new data from the Interactor)

+ Entity -- 包含 用于 Interactor 的基本模型对象

+ Routing -- 包含 描述 screen 如何显示的 (which screens are shown in which order) 导航逻辑

***Interactor 处理业务, Presenter 负责交互, View 负责视觉效果***

+ An Interactor, which contains the business logic as specified by a use case

+ A Presenter, which containts view logic for preparing content for display (as received from the Interactor) and reacting to user inputs (by requesting new data from the Interactor)

+ A View, which displays what it is told to by the Presenter and relays user input back to the Presenter

-----

+ Interactor -- Represents a single use case in the app. It contains the business logic to manipulate (操纵) model objects (Entities) to carry out a specific task.

+ Entity (Model) -- Model objects manipulated by an Interactor. Entities are only manipulated by the Interactor. The Interactor never passes Entities to the presentation layer.

+ Data Store -- (e.g. web service, database) is responsible for providing **Entities** to an **Interactor**. As an **Interactor** applies its business logic it will typically retrieve **Entities** from the *Data Store*, manipulate the **Entities** and then put the updated **Entities** back in the *Data Store*. The *Data Store* manages the persistence of the **Entities**. **Entities** do not know about the *Data Store*, so **Entities** do not know how to persist themselves.

+ Presenter -- (Plain Old NSObject) which mainly consists of logic to drive the UI. It gathers input from user interactions so it can send requests to an **Interactor**. The Presenter also receives results from an **Interactor** and converts the results into a *form* that is efficient to display in a **View**.

  **Entities** are never passed from the **Interactor** to the **Presenter**. Instead, *simple data structures* that have no behavior are passed from the **Interactor** to the **Presenter**. This prevents any "real work" from being done in the **Presenter**. The **Presenter** can only prepare the data for display in the **View**.

+ View -- (Passive), waits for the **Presenter** to give it content to display; it never asks the **Presenter** for data. Method defined for a View should allow a **Presenter** to communicate at a higher level of abstraction, expressed in terms of its content and not how that content is to be displayed. The **Presenter** does not know about the existence of UILabel, UIButton, etc. The **Presenter** only knows about the content it maintains and when it should be displayed. It is up to the **View** to determine how the content is displayed.

  The **View** is an abstract interface defined as protocol.

  ```
  @protocol LoginView <NSObject>
  - (void)setUserName: (NSString *)userName;
  - (void)setPassword: (NSString *)password;
  - (void)setLoginEnabled: (BOOL)enabled;
  ...
  @end
  ```
