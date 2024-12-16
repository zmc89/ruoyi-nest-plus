<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="用户名" prop="userName">
        <el-input
          v-model="queryParams.userName"
          placeholder="请输入用户名"
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
          v-hasPermi="['health:state:add']"
        >新增
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="Edit"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['health:state:edit']"
        >修改
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="Delete"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['health:state:remove']"
        >删除
        </el-button>
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="stateList">
      <el-table-column label="健康状态内容" align="center" prop="healthStateContent" />
      <el-table-column label="健康状态描述" align="center" prop="healthStateDesc" />
      <el-table-column label="健康状态图片" align="center" prop="healthStateImg" />
      <el-table-column label="健康状态标签" align="center" prop="healthStateTag" />
      <el-table-column label="创建时间" align="center" prop="createTime" />
      <el-table-column label="关联用户id" align="center" prop="userId" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template v-slot="{row}">
          <el-button link type="primary" icon="Edit" @click="handleUpdate(row)" v-hasPermi="['health:state:edit']">
            修改
          </el-button>
          <el-button link type="primary" icon="Delete" @click="handleDelete(row)" v-hasPermi="['health:state:remove']">
            删除
          </el-button>
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
    <el-dialog v-model="showState" :title="stateTitle" width="500">
      <el-form :model="form" label-width="auto" style="max-width: 600px" ref="formRef" :rules="rules">
        <el-form-item label="健康状态内容">
          <editor v-model="form.healthStateContent" :min-height="192" />
        </el-form-item>
        <el-form-item label="健康状态标签" prop="healthStateTag">
          <el-select
            v-model="form.healthStateTag"
            multiple
            placeholder="请选择健康状态标签"
            style="width: 240px"
          >
            <el-option
              v-for="item in health_state_tag"
              :key="item.value"
              :label="item.label"
              :value="item.value"
            />
          </el-select>
        </el-form-item>
        <el-form-item label="健康状态图片" prop="healthStateImg">
          <image-upload v-model="form.healthStateImg" :limit="10"></image-upload>
        </el-form-item>
      </el-form>
      <template #footer>
        <div class="dialog-footer">
          <el-button @click="cancel" class="defauleButton">取消</el-button>
          <el-button type="primary" @click="confirm"> 确定</el-button>
        </div>
      </template>
    </el-dialog>
  </div>
</template>

<script setup>
import { listState, getState, delState, addState, updateState } from '@/api/health/state'
import { getCurrentInstance, ref } from 'vue'
import ImageUpload from '@/components/ImageUpload/index.vue'

const { proxy } = getCurrentInstance()
const { health_state_tag } = proxy.useDict("health_state_tag");

const queryParams = ref({
  userName: null,
  pageNum: 1,
  pageSize: 10
})
const loading = ref(true)
const total = ref(0)
const stateList = ref([])
const showSearch = ref(false)
const single = ref(true)
const multiple = ref(true)
const queryRef = ref(null)
const showState = ref(false)
const stateTitle = ref('')
const formRef = ref(null)
const form = ref({
  healthStateTag: '',
  healthStateContent: '',
  healthStateImg: '',
  tenantCode: '',
  userId: ''
})
const rules = ref({})

const cancel = () => close()
const confirm = () => {
  formRef.value.validate((valid) => {
    if (valid) {
      const action = form.value.healthStateId ? updateState : addState
      action(form.value).then(() => {
        proxy.$modal.msgSuccess('操作成功')
        emit('update')
        close()
      })
    }
  })
}
const close = () => showState.value = false
const reset = () => {
  form.value = {
    healthStateTag: '',
    healthStateContent: '',
    healthStateImg: '',
    tenantCode: '',
    userId: ''
  }
  proxy.resetForm('formRef')
}


const queryHandler = () => {
  queryParams.value.pageNum = 1
  getList()
}
const getList = () => {
  loading.value = true
  listState(queryParams.value).then((res) => {
    stateList.value = res.data.list
    total.value = res.data.total
    loading.value = false
  })
}
const resetQuery = () => {
  proxy.resetForm('queryRef')
  queryHandler()
}

const handleQuery = () => {
  queryHandler()
}

const handleUpdate = (row) => {

}
const handleAdd = () => {
  reset()
  stateTitle.value = '新增健康状态辩证'
  showState.value = true
}
const handleDelete = (row) => {
  proxy.$modal
    .confirm('是否确认删除编号为"' + row.healthStateId + '"的数据项?')
    .then(function() {
      return delState(row.healthStateId)
    })
    .then(() => {
      getList()
      proxy.$modal.msgSuccess('删除成功')
    })
    .catch(() => {
    })
}
const updateHandler = () => {
  queryHandler()
}
getList()
</script>
