<template>
  <div id="app" class="common-layout">

      <el-container>
        <el-header style="text-align: right; font-size: 12px;background-color: #409eff;">
          <div class="toolbar">
            <div class="left">
              <img src="@/assets/logo.png" class="logo" alt="">
            </div>
            <div class="right">
             
            <el-dropdown>
              <el-icon style="margin-right: 8px; margin-top: 1px" size="30px">
                <user />
              </el-icon>
              <template #dropdown>
                <el-dropdown-menu>
                  <el-dropdown-item @click.native="$router.push('/3-3')">个人中心</el-dropdown-item>
                  <el-dropdown-item @click.native="$router.push('/3-1')">发布帖子</el-dropdown-item>
                  <el-dropdown-item @click.native="$router.push('/')">退出登录</el-dropdown-item>
                </el-dropdown-menu>
              </template>
            </el-dropdown>
             <span class="username">{{user.username}}</span>
            </div>
          </div>
        </el-header>
        <el-container class="MainAndAside" style="height: 100%">
          <el-aside width="200px" style="backgroung:#409eff;">
            <el-scrollbar>
              <el-menu :default-openeds="[]" router>
                  <el-menu-item index="1" >
                    <el-icon><House /></el-icon>我的首页
                  </el-menu-item>

                <el-sub-menu index="2">
                  <template #title>
                    <el-icon><HelpFilled /></el-icon>帖子浏览
                  </template>
                  <el-menu-item-group>
                    <el-menu-item index="2-1">交友组局</el-menu-item>
                    <el-menu-item index="2-2">失物招领</el-menu-item>
                    <el-menu-item index="2-3">二手交易</el-menu-item>
                  </el-menu-item-group>
                </el-sub-menu>

                <el-sub-menu index="3">
                  <template #title>
                    <el-icon><Menu /></el-icon>我的菜单
                  </template>
                  <el-menu-item-group>
                    <el-menu-item index="3-1">发布帖子</el-menu-item>
                    <el-menu-item index="3-2">我的帖子</el-menu-item>
                    <el-menu-item index="3-3">个人中心</el-menu-item>
                  </el-menu-item-group>
                </el-sub-menu>

                <el-menu-item index="4" >
                  <el-icon><ChatDotSquare /></el-icon>我的消息
                </el-menu-item>
              </el-menu>
            </el-scrollbar>
          </el-aside>
          <el-main>
            <router-view></router-view>
          </el-main>
        </el-container>
      </el-container>
  </div>


</template>

<script>
export default {
  name: "Index",
  computed: {
    user(){
      return this.$store.getters.getUser;
    }
  },
  data() {
    return {

    }
  }
}
</script>


<style scoped>
.logo{
  width: 60px;
  height: 40px;
  object-fit: cover;
}
.MainAndAside .el-header {
  position: relative;
  background-color: var(--el-color-primary-light-7);
  color: var(--el-text-color-primary);
}
.MainAndAside .el-aside {
  color: var(--el-text-color-primary);
  background: var(--el-color-primary-light-8);
}
.MainAndAside .el-menu {
  border-right: none;
  background: #d9ecff !important;
}
.MainAndAside .el-main {
  padding: 0;
}
 .toolbar { 
  display: flex;
  align-items: center;
  justify-content: space-between;
  height: 100%;
  line-height: 100%;
  
}
 .toolbar .right{
   color: #fff;
   font-size: 16px;
    display: flex;
    align-items: center;
    justify-content: center;

 }
 .username{
   margin-right: 10px;
   font-size: 20px;
   cursor: pointer;
   font-weight: bold;
 }
 .el-icon svg{
   color: #fff;
   cursor: pointer;
 }
 .MainAndAside .el-icon svg{
   color: #333;
   cursor: pointer;
 }
.left{
  border-radius: 50%;
  height: 50px;
  width: 50px;
}
.left img{
  border-radius: 50%;
  height: 100%;
  width: 100%;
}
</style>