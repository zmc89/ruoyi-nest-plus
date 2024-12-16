<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="姓名" prop="doctorName">
        <el-input
          v-model="queryParams.doctorName"
          placeholder="请输入医生姓名"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="联系方式" prop="doctorPhone">
        <el-input
          v-model="queryParams.doctorPhone"
          placeholder="请输入医生联系方式"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="职称" prop="doctorPostId">
        <el-select v-model="queryParams.doctorPostId" placeholder="请选择医生职称" clearable>
          <el-option v-for="dict in sys_docter_post" :key="dict.value" :label="dict.label" :value="dict.value" />
        </el-select>
      </el-form-item>
      <el-form-item label="所在科室" prop="doctorDeptId">
          <el-tree-select v-model="queryParams.doctorDeptId" :data="deptOptions" :props="{ value: 'hospitalDeptId', label: 'deptName', children: 'children' }" value-key="id" placeholder="请选择归属部门" check-strictly />
      </el-form-item>
      <el-form-item label="状态" prop="status">
        <el-select v-model="queryParams.status" placeholder="请选择状态" clearable>
         <el-option v-for="dict in sys_normal_disable" :key="dict.value" :label="dict.label" :value="dict.value" />
        </el-select>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="Search" @click="handleQuery">搜索</el-button>
        <el-button icon="Refresh" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>
    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="Plus"
          @click="handleAdd"
          v-hasPermi="['system:doctor:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="Edit"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['system:doctor:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="Delete"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['system:doctor:remove']"
        >删除</el-button>
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="doctorList" >
      <el-table-column label="医生姓名" align="center" prop="doctorName" />
      <el-table-column label="医生头像" align="center" prop="doctorAvatar" />
      <el-table-column label="医生简介" align="center" prop="doctorIntro" />
      <el-table-column label="医生擅长" align="center" prop="doctorGoodAt" />
      <el-table-column label="医生联系方式" align="center" prop="doctorPhone" />
      <el-table-column label="医生职称" align="center" prop="doctorPostId" />
      <el-table-column label="医生所在科室" align="center" prop="doctorDeptId" />
      <el-table-column label="是否首页推荐" align="center" prop="isRecommend" />
      <el-table-column label="备注" align="center" prop="remark" />
      <el-table-column label="状态" align="center" prop="status" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template v-slot="{row}">
          <el-button link type="primary" icon="Edit" @click="handleUpdate(row)" v-hasPermi="['system:doctor:edit']">修改</el-button>
          <el-button link type="primary" icon="Delete" @click="handleDelete(row)" v-hasPermi="['system:doctor:remove']">删除</el-button>
        </template>
      </el-table-column>

    </el-table>
    <pagination
      v-show="total>0"
      :total="total"
      v-model:page="queryParams.pageNum"
      v-model:limit="queryParams.pageSize"
      @pagination="getList"
    />
  </div>
</template>
<script setup>
import { listDoctor, getDoctor, delDoctor, addDoctor, updateDoctor } from "@/api/hospital/doctor";
import { departmentsTreeSelect } from '@/api/hospital/departments'
const { proxy } = getCurrentInstance();

import { ref } from 'vue'
const loading = ref(false);
const total = ref(0);
const doctorList = ref([]);
const showSearch = ref(true);
const single = ref(true);
const multiple = ref(true);
const deptOptions = ref([])
const { sys_docter_post } = proxy.useDict('sys_docter_post')
const { sys_normal_disable } = proxy.useDict('sys_normal_disable')
const queryParams = ref({
  pageNum: 1,
  pageSize: 10,
  doctorName: null,
  doctorPhone: null,
  doctorPostId: null,
  doctorDeptId: null,
  status: null,
});


const handleQuery = ()=> {
  getList()
}

const handleAdd = () => {

}

const resetQuery = () => {

}

const handleUpdate = (row) => {

};
const handleDelete = (row) => {
  proxy.$modal
    .confirm('是否确认删除编号为"' + row.doctorId + '"的数据项?')
    .then(function () {
      return delDoctor(row.doctorId);
    })
    .then(() => {
      getList();
      proxy.$modal.msgSuccess("删除成功");
    })
};

const getDept =() => {
  departmentsTreeSelect().then(res => {
    deptOptions.value = res.data
  })
}

const getList = () => {
  loading.value = true
  listDoctor(queryParams.value).then((res) => {
    doctorList.value = res.data.list;
    total.value = res.data.total;
    loading.value = false
  });
};
getDept()
getList()
</script>



<style scoped lang="less">

</style>
