

<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="120px">
      <el-form-item label="医生姓名" prop="doctorName">
        <el-input
          v-model="queryParams.doctorName"
          placeholder="请输入医生姓名"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="医生联系方式" prop="doctorPhone">
        <el-input
          v-model="queryParams.doctorPhone"
          placeholder="请输入医生联系方式"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>

      <el-form-item label="医生职称" prop="doctorPostId">
        <el-input
          v-model="queryParams.doctorPostId"
          placeholder="请输入医生职称"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>

      <el-form-item label="科室" prop="doctorDeptId">
        <el-input
          v-model="queryParams.doctorDeptId"
          placeholder="科室"
          clearable
          @keyup.enter="handleQuery"
        />
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
          v-hasPermi="['hospital:doctor:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="Edit"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['hospital:doctor:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="Delete"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['hospital:doctor:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="Download"
          @click="handleExport"
          v-hasPermi="['hospital:doctor:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="doctorList" >
      <el-table-column label="姓名" align="center" prop="doctorName" />
      <el-table-column label="联系方式" align="center" prop="doctorPhone" />
      <el-table-column label="头像" align="center" prop="doctorAvatar" />
      <el-table-column label="职称" align="center" prop="doctorPostId" />
      <el-table-column label="科室" align="center" prop="doctorDeptId" />
      <el-table-column label="简介" align="center" prop="doctorIntro" />
      <el-table-column label="擅长" align="center" prop="doctorGoodAt" />
      <el-table-column label="是否首页推荐" align="center" prop="isRecommend" />
      <el-table-column label="备注" align="center" prop="remark" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template v-slot="{row}">
          <el-button link type="primary" icon="Edit" @click="handleUpdate(row)" v-hasPermi="['hospital:doctor:edit']">修改</el-button>
          <el-button link type="primary" icon="Delete" @click="handleDelete(row)" v-hasPermi="['hospital:doctor:remove']">删除</el-button>
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


<script setup name="Doctor">
import { listDoctor, getDoctor, delDoctor, addDoctor, updateDoctor } from "@/api/system/doctor";
import { getCurrentInstance,ref } from "vue"
const { proxy } = getCurrentInstance();

const queryParams = ref({
  pageNum: 1,
  pageSize: 10,
});
const loading = ref(true)
const total = ref(0)
const dataList = ref([])
const indexDialogRef = ref(null)
const queryRef = ref(null)
const queryHandler = () => {
  queryParams.value.pageNum = 1;
  getList();
};
const getList = () => {
  loading.value = true
  listDoctor(queryParams.value).then(({data,total:temTotal}) => {
    dataList.value = data;
    total.value = temTotal;
    loading.value = false
  });
};
const resetQuery = () => {
  proxy.resetForm("queryRef");
  queryHandler()
};
const handleUpdate = (row) => {
  demoDialogRef.value.openDialog(row);
};
const handleAdd = () => {
  demoDialogRef.value.openDialog();
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
    .catch(() => {});
};
const updateHandler = () => {
  queryHandler();
};
const  handleExport = () =>{ proxy.download('system/doctor/export', {...queryParams.value}, `doctor_${new Date().getTime()}.xlsx`)}
getList();
</script>



