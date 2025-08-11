import { createStore } from 'vuex'

export default createStore({
  state: {
    user: null, // 用户信息
    currentPost: null// 点击的帖子
  },
  getters: {
    getUser: state => state.user, // 确保 getter 名称和调用一致
    getCurrentPost: state => state.currentPost
  },
  mutations: {
    setUser(state, user) {
      state.user = user;
    },
    setCurrentPost(state, post) {
      state.currentPost = post; // 设置当前选中的帖子
    }
  },
  actions: {
    updateUser({ commit }, user) {
      commit('setUser', user);
      // 这里还可以添加异步操作，如发送请求更新服务器上的用户数据
    },
    updateCurrentPost({ commit }, post) {
      commit('setCurrentPost', post); // 通过提交 mutation 更新当前选中的帖子
    }
  },
  modules: {
  }
})
