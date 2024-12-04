import Cookies from 'js-cookie'
import { encrypt, decrypt } from '@/utils/jsencrypt'
import { reactive } from 'vue'
import { ElMessage } from 'element-plus'
import { getCodeImg } from '@/api/login'

// 验证码相关信息
const authCodeInfo = reactive({
  captchaEnabled: false, // 验证码开关
  loading: false, // 是否加载中
  imgUrl: '', // 验证码图片地址
  uuid: '' // 验证码唯一标识
})

/**
 * 获取图片验证码
 * @param data 表单数据
 * @param isClick 是否点击触发
 */
const getValidateCode = async (form, isClick) => {
  try {
    if ((form.username === '' || form.username === undefined) && isClick) {
      ElMessage.error('请输入用户账号')
      return
    }

    if ((form.password === '' || form.password === undefined) && isClick) {
      ElMessage.error('请输入用户密码')
      return
    }

    if (authCodeInfo.loading) {
      ElMessage.warning('正在请求验证码，请稍等')
      return
    }

    const { data } = await getCodeImg()
    authCodeInfo.loading = true
    authCodeInfo.captchaEnabled = data.captchaEnabled === undefined ? true : data.captchaEnabled
    authCodeInfo.uuid = data.uuid
    if (authCodeInfo.captchaEnabled) {
      authCodeInfo.imgUrl = data.img
      authCodeInfo.loading = false
    }
  } catch (err) {
    console.log('验证码获取错误:', err)
  }
}

// 从cookie中获取登录用户信息
const getUserCookie = (data) => {
  const username = Cookies.get('username')
  const password = Cookies.get('password')
  const rememberMe = Cookies.get('rememberMe')
  const form = {
    username: username === undefined ? data.username : username,
    password: password === undefined ? data.password : decrypt(password),
    rememberMe: rememberMe === undefined ? false : Boolean(rememberMe)
  }
  return form
}

// 在Cookie中的记住用户信息,勾选了需要记住密码设置在 cookie 中设置记住用户名和密码，否则移除
const setUserCookie = (data) => {
  if (data.rememberMe) {
    Cookies.set('username', data.username, { expires: 30 })
    Cookies.set('password', encrypt(data.password), { expires: 30 })
    Cookies.set('rememberMe', data.rememberMe, { expires: 30 })
  } else {
    Cookies.remove('username')
    Cookies.remove('password')
    Cookies.remove('rememberMe')
  }
}

export default { getValidateCode, getUserCookie, setUserCookie, authCodeInfo }
