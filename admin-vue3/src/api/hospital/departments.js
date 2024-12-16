
import request from '@/utils/request'
// 查询医院科室表列表
export function listDepartments(query) {
  return request({
    url: '/hospital/departments/list',
    method: 'get',
    params: query
  })
}
// 查询医院科室表详细
export function getDepartments(hospitalDeptId) {
  return request({
    url: '/hospital/departments/' + hospitalDeptId,
    method: 'get'
  })
}

// 新增医院科室表
export function addDepartments(data) {
  return request({
    url: '/hospital/departments',
    method: 'post',
    data: data
  })
}

// 修改医院科室表
export function updateDepartments(data) {
  return request({
    url: '/hospital/departments',
    method: 'put',
    data: data
  })
}

// 删除医院科室表
export function delDepartments(hospitalDeptId) {
  return request({
    url: '/hospital/departments/' + hospitalDeptId,
    method: 'delete'
  })
}

// 查询科室列表（排除节点）
export function listDeptExcludeChild(hospitalDeptId) {
  return request({
    url: '/hospital/departments/list/exclude/' + hospitalDeptId,
    method: 'get'
  })
}

// 查询科室下拉树结构
export function departmentsTreeSelect() {
  return request({
    url: '/hospital/departments/departmentsTree',
    method: 'get'
  })
}


