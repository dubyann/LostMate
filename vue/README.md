### 配置

> 详见package.json
>

### 缺少vue-cli
根目录命令行安装
```
npm install --save-dev vue-cli
```
### 启动

控制台输入：npm run serve

### 关闭

控制台输入：ctrl+c

### 页面

1. Admin：管理员后台主界面,未开发
2. ForgetPassword：忘记密码
   1. 未校验表单
   2. 根据邮箱查表
   3. 更新密码（后续可选：进行哈希加密或使用Spring Security）

3. Login：登录
   1. 未校验表单

4. Register：注册
   - 未校验表单
   - 实现验证码功能
5. Index：平台父页面
   1. header 右上角用户名
   2. header用户头标下拉的功能选项(**路由未设置**)
   3. 侧边栏路由跳转

6. HomePage：平台首页
   1. 仅实现了带帖子类型的关键字模糊查找
   2. 分页功能

7. MyPost：我的帖子页面
   1. 根据用户id查表
   2. 具体**操作按钮未实现**

8. Post：帖子详细页
   1. 对帖子内容进行展示(解析HTML)

9. PostAPage/PostBPage/PostCPage：三种类型帖子的浏览页
   1. 实现了分页功能
   2. 可点击标题跳转详细页
   3. 三个页面实现基本一致，仅改变了post.category字段值

10. UserInfo：用户信息页面
    1. **未实现用户头像上传，信息修改**

11. UserMessage
    1. **未实现用户收到信息，如帖子通过审核等**

12. WritePost：帖子编写界面
    1. 实现了图片上传
    2. 实现了富文本编辑器


### 后端接口

#### /user

1. /insertUser POST 用于注册用户
2. /login POST 用于登录
3. /resetPassword POST 用于重置密码

#### /post

1. /search GET 用于根据关键词和类型模糊查找
2. /addPost POST 用于发布帖子
3. /findByUserId GET 用于获取用户的所有帖子

#### /upload

1. /image POST 用于图片/头像上传



### sql

users

```sql
create table design.users
(
    user_id      int auto_increment
        primary key,
    username     varchar(50)                           not null,
    password     varchar(255)                          not null,
    email        varchar(100)                          not null,
    status       varchar(10) default '正常'              not null comment '1.正常
2.冻结
3.封禁',
    role         varchar(10) default '用户'              not null,
    avatar_url   varchar(255)                          null,
    phone_number varchar(20)                           null,
    birthdate    date                                  null,
    address      text                                  null,
    created_at   timestamp   default CURRENT_TIMESTAMP null,
    updated_at   timestamp   default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP,
    constraint email
        unique (email),
    constraint username
        unique (username)
);

```

posts

```sql
create table design.posts
(
    post_id    int auto_increment
        primary key,
    user_id    int                                   not null,
    category   varchar(10)                           not null comment '1 交友组局
2 失物招领
3 二手交易',
    title      varchar(255)                          not null,
    content    text                                  not null,
    image_url  varchar(255)                          null,
    status     varchar(10) default '待审核'             not null comment '1 待审核
2 审核通过
3 审核未通过',
    created_at timestamp   default CURRENT_TIMESTAMP null,
    updated_at timestamp   default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP,
    constraint posts_ibfk_1
        foreign key (user_id) references design.users (user_id)
);

create index user_id
    on design.posts (user_id);

```

post_approvals 用于管理员审核，暂未使用

```sql
create table design.post_approvals
(
    approval_id int auto_increment
        primary key,
    post_id     int                                 not null,
    admin_id    int                                 not null,
    status      varchar(10)                         not null comment '2 审核通过
3 审核未通过',
    reason      text                                null,
    created_at  timestamp default CURRENT_TIMESTAMP null,
    constraint post_approvals_ibfk_1
        foreign key (post_id) references design.posts (post_id),
    constraint post_approvals_ibfk_2
        foreign key (admin_id) references design.users (user_id)
);

create index admin_id
    on design.post_approvals (admin_id);

create index post_id
    on design.post_approvals (post_id);

```

comment 用于实现评论功能，暂未使用

```sql
create table design.comments
(
    comment_id int auto_increment
        primary key,
    post_id    int                                 not null,
    user_id    int                                 not null,
    content    text                                not null,
    created_at timestamp default CURRENT_TIMESTAMP null,
    constraint comments_ibfk_1
        foreign key (post_id) references design.posts (post_id),
    constraint comments_ibfk_2
        foreign key (user_id) references design.users (user_id)
);

create index post_id
    on design.comments (post_id);

create index user_id
    on design.comments (user_id);

```

