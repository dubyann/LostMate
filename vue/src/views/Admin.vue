<!--
<template>
  <div id="app">
    <el-container style="height: 100vh; border: 1px solid #ebeef5;">
      <el-aside width="200px" style="background-color: #f5f7fa;">
        <el-menu :default-openeds="['1', '3']">
          <el-sub-menu index="1">
            <template #title>
              <el-icon><message /></el-icon>
              <span>帖子管理</span>
            </template>
            <el-menu-item index="1-1" @click="goToReviewPosts">审核帖子</el-menu-item>
            <el-menu-item index="1-2" @click="goToPublishedPosts">已发布帖子</el-menu-item>
          </el-sub-menu>
          <el-sub-menu index="2">
            <template #title>
              <el-icon><user /></el-icon>
              <span>用户管理</span>
            </template>
            <el-menu-item index="2-1" @click="goToUserList">用户列表</el-menu-item>
&lt;!&ndash;            <el-menu-item index="2-2">权限管理</el-menu-item>&ndash;&gt;
          </el-sub-menu>
          <el-sub-menu index="3">
            <template #title>
              <el-icon>
                <setting/>
              </el-icon>
              <span>系统设置</span>
            </template>
            <el-menu-item index="3-1">基本设置</el-menu-item>
            <el-menu-item index="3-2">安全设置</el-menu-item>
          </el-sub-menu>
        </el-menu>
      </el-aside>

      <el-container>
        <el-header style="height: 60px; line-height: 60px; background-color: #fff;">
          <div class="toolbar">
            <el-dropdown trigger="hover">
              <span class="el-dropdown-link">
                <el-icon><setting/></el-icon>
                设置
              </span>
              <el-dropdown-menu slot="dropdown">
                <el-dropdown-item>查看</el-dropdown-item>
                <el-dropdown-item>添加</el-dropdown-item>
                <el-dropdown-item>删除</el-dropdown-item>
              </el-dropdown-menu>
            </el-dropdown>
            <span style="float: right; margin-right: 20px;">{{ adminName }}</span>
          </div>
        </el-header>

        <el-main>
          <router-view></router-view>
        </el-main>
      </el-container>
    </el-container>
  </div>
</template>

<script>
export default {
  name: "Admin",
  data() {
    return {
      adminName: '',
    };
  },
  methods: {
    goToReviewPosts() {
      this.$router.push({name: 'reviewPosts'});
    },
    goToPublishedPosts() {
      this.$router.push({name: 'publishedPosts'});
    },
    goToUserList() {
      this.$router.push({name: 'userList'});
    }
  }
}
</script>

<style scoped>
.toolbar {
  padding: 0 20px;
}

.el-header, .el-aside {
  color: #333;
}
</style>
-->



<template>
  <div id="app">
    <el-container style="height: 100vh; border: 1px solid #ebeef5;">
      <el-aside width="200px" style="background-color: #f5f7fa;">
        <el-menu :default-openeds="['1', '3']">
          <el-sub-menu index="1">
            <template #title>
              <el-icon><message /></el-icon>
              <span>帖子管理</span>
            </template>
            <el-menu-item index="1-1" @click="goToReviewPosts">审核帖子</el-menu-item>
            <el-menu-item index="1-2" @click="goToPublishedPosts">已发布帖子</el-menu-item>
          </el-sub-menu>
          <el-sub-menu index="2">
            <template #title>
              <el-icon><user /></el-icon>
              <span>用户管理</span>
            </template>
            <el-menu-item index="2-1" @click="goToUserList">用户列表</el-menu-item>
          </el-sub-menu>
          <el-sub-menu index="3">
            <template #title>
              <el-icon><setting/></el-icon>
              <span>系统设置</span>
            </template>
            <el-menu-item index="3-1" @click="goToBasicSettings">基本设置</el-menu-item>
            <el-menu-item index="3-2" @click="goToSecuritySettings">安全设置</el-menu-item>
          </el-sub-menu>
        </el-menu>
      </el-aside>

      <el-container>
        <!-- <el-header style="height: 60px; line-height: 60px; background-color: #fff;">
          <div class="toolbar">
            <el-dropdown trigger="hover">
              <span class="el-dropdown-link">
                <el-icon><setting/></el-icon>
                设置
              </span>
              <el-dropdown-menu slot="dropdown">
                <el-dropdown-item>查看</el-dropdown-item>
                <el-dropdown-item>添加</el-dropdown-item>
                <el-dropdown-item>删除</el-dropdown-item>
              </el-dropdown-menu>
            </el-dropdown>
            <span style="float: right; margin-right: 20px;">{{ adminName }}</span>
          </div>
        </el-header> -->

        <el-main>
          <router-view></router-view>
        </el-main>
      </el-container>
    </el-container>
  </div>
</template>

<script>
export default {
  name: "Admin",
  data() {
    return {
      adminName: '',
    };
  },
  methods: {
    goToReviewPosts() {
      this.$router.push({ name: 'reviewPosts' });
    },
    goToPublishedPosts() {
      this.$router.push({ name: 'publishedPosts' });
    },
    goToUserList() {
      this.$router.push({ name: 'userList' });
    },
    goToBasicSettings() {
      this.$router.push({ name: 'basicSettings' });
    },
    goToSecuritySettings() {
      this.$router.push({ name: 'securitySettings' });
    }
  }
}
</script>

<style scoped>
.toolbar {
  padding: 0 20px;
}

.el-header, .el-aside {
  color: #333;
}
 .el-menu {
  border-right: none;
  background: #d9ecff !important;
}
</style>
