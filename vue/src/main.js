import './plugins/axios';
import { createApp } from 'vue';
import App from './App.vue';
import router from './router';
import store from './store';
import ElementPlus from 'element-plus';
import 'element-plus/dist/index.css';
import * as Icons from '@element-plus/icons-vue';
import axios from './plugins/axios.js';

const app = createApp(App);

// 全局注册所有 Element Plus 图标组件
for (const [key, component] of Object.entries(Icons)) {
    app.component(key, component);
}

// 使用 Element Plus、store 和 router
app.use(router);
app.use(store); // 确保 store 也被使用
app.use(ElementPlus);
app.use(axios);

// 挂载应用
app.mount('#app');
