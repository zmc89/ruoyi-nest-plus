
import request from '@/utils/request'
// 查询健康状态辩证表列表
export function listState(query) {
  return request({
    url: '/health/state/list',
    method: 'get',
    params: query
  })
}
// 查询健康状态辩证表详细
export function getState(healthStateId) {
  return request({
    url: '/health/state/' + healthStateId,
    method: 'get'
  })
}

// 新增健康状态辩证表
export function addState(data) {
  return request({
    url: '/health/state',
    method: 'post',
    data: data
  })
}

// 修改健康状态辩证表
export function updateState(data) {
  return request({
    url: '/health/state',
    method: 'put',
    data: data
  })
}

// 删除健康状态辩证表
export function delState(healthStateId) {
  return request({
    url: '/health/state/' + healthStateId,
    method: 'delete'
  })
}

