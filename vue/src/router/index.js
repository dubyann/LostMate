/*
import { createRouter, createWebHistory } from 'vue-router'

// 导入所有必要的组件
import Login from '../views/Login.vue'
import Register from '../views/Register.vue'
import ForgetPassword from '../views/ForgetPassword.vue'
import Admin from '../views/Admin'
import ReviewPosts from '../views/ReviewPosts'  // 审核帖子的组件
import ManageUsers from '../views/ManageUsers'  // 管理用户的组件
import UserList from '@/views/UserList.vue';    // 用户列表组件
import PublishedPosts from '@/views/PublishedPosts.vue';  // 已发布帖子组件

// 其他页面的导入
import Index from '../views/Index'
import MyPost from '../views/MyPost'
import HomePage from '../views/HomePage'
import PostAPage from "@/views/PostAPage";
import PostBPage from "@/views/PostBPage";
import PostCPage from "@/views/PostCPage";
import UserInfo from "@/views/UserInfo";
import UserMessage from "@/views/UserMessage";
import WritePost from "@/views/WritePost";
import Post from '../views/Post'

const routes = [
  {
    path: '/',
    name: 'login',
    component: Login
  },
  {
    path: '/register',
    name: 'register',
    component: Register
  },
  {
    path: '/forgetPassword',
    name: 'forgetPassword',
    component: ForgetPassword
  },
  {
    path: '/admin',
    name: 'admin',
    component: Admin,
    children: [
      {
        path: 'review-posts',
        name: 'reviewPosts',
        component: ReviewPosts  // 审核帖子页面
      },
      {
        path: 'published-posts',
        name: 'publishedPosts',
        component: PublishedPosts  // 已发布帖子页面
      },
      {
        path: 'manage-users',
        name: 'manageUsers',
        component: ManageUsers,  // 管理用户页面
        children: [
          {
            path: 'user-list',  // 用户列表子页面
            name: 'userList',
            component: UserList
          }
        ]
      }
    ]
  },
  {
    path: '/index',
    name: 'index',
    component: Index,
    children: [
      {
        path: '1',
        name: 'homePage',
        component: HomePage
      },
      {
        path: '2-1',
        name: 'postAPage',
        component: PostAPage
      },
      {
        path: '2-2',
        name: 'postBPage',
        component: PostBPage
      },
      {
        path: '2-3',
        name: 'postCPage',
        component: PostCPage
      },
      {
        path: '3-1',
        name: 'writePost',
        component: WritePost
      },
      {
        path: '3-2',
        name: 'myPost',
        component: MyPost
      },
      {
        path: '3-3',
        name: 'userInfo',
        component: UserInfo
      },
      {
        path: '4',
        name: 'userMessage',
        component: UserMessage
      },
      {
        path: '/post/:postId',
        name: 'post',
        component: Post
      }
    ]
  }
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router;
*/



import { createRouter, createWebHistory } from 'vue-router'

// 导入所有必要的组件
import Login from '../views/Login.vue'
import Register from '../views/Register.vue'
import ForgetPassword from '../views/ForgetPassword.vue'
import Admin from '../views/Admin'
import ReviewPosts from '../views/ReviewPosts'  // 审核帖子的组件
import ManageUsers from '../views/ManageUsers'  // 管理用户的组件
import UserList from '@/views/UserList.vue';    // 用户列表组件
import PublishedPosts from '@/views/PublishedPosts.vue';    // 已发布帖子组件
import BasicSettings from '@/views/BasicSettings.vue';      // 基本设置组件
import SecuritySettings from '@/views/SecuritySettings.vue';// 安全设置组件

// 其他页面的导入
import Index from '../views/Index'
import MyPost from '../views/MyPost'
import HomePage from '../views/HomePage'
import PostAPage from "@/views/PostAPage";
import PostBPage from "@/views/PostBPage";
import PostCPage from "@/views/PostCPage";
import UserInfo from "@/views/UserInfo";
import UserMessage from "@/views/UserMessage";
import WritePost from "@/views/WritePost";
import Post from '../views/Post'

const routes = [
  {
    path: '/',
    name: 'login',
    component: Login
  },
  {
    path: '/register',
    name: 'register',
    component: Register
  },
  {
    path: '/forgetPassword',
    name: 'forgetPassword',
    component: ForgetPassword
  },
  {
    path: '/admin',
    name: 'admin',
    component: Admin,
    children: [
      {
        path: 'review-posts',
        name: 'reviewPosts',
        component: ReviewPosts  // 审核帖子页面
      },
      {
        path: 'published-posts',
        name: 'publishedPosts',
        component: PublishedPosts  // 已发布帖子页面
      },
      {
        path: 'manage-users',
        name: 'manageUsers',
        component: ManageUsers,  // 管理用户页面
        children: [
          {
            path: 'user-list',  // 用户列表子页面
            name: 'userList',
            component: UserList
          }
        ]
      },
      {
        path: 'basic-settings',
        name: 'basicSettings',
        component: BasicSettings  // 基本设置页面
      },
      {
        path: 'security-settings',
        name: 'securitySettings',
        component: SecuritySettings  // 安全设置页面
      }
    ]
  },
  {
    path: '/index',
    name: 'index',
    component: Index,
    children: [
      {
        path: '1',
        name: 'homePage',
        component: HomePage
      },
      {
        path: '2-1',
        name: 'postAPage',
        component: PostAPage
      },
      {
        path: '2-2',
        name: 'postBPage',
        component: PostBPage
      },
      {
        path: '2-3',
        name: 'postCPage',
        component: PostCPage
      },
      {
        path: '3-1',
        name: 'writePost',
        component: WritePost
      },
      {
        path: '3-2',
        name: 'myPost',
        component: MyPost
      },
      {
        path: '3-3',
        name: 'userInfo',
        component: UserInfo
      },
      {
        path: '4',
        name: 'userMessage',
        component: UserMessage
      },
      {
        path: '/post/:postId',
        name: 'post',
        component: Post
      }
    ]
  }
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router
