export default function({ $axios, store }) {
  $axios.interceptors.request.use(config => {
    config.headers.common['access-token'] =
      store.$auth.$storage._state['_token.auth0']
    config.headers.common['Access-Control-Allow-Origin'] = '*'
    config.headers.common['access-token'] =
      store.$auth.$storage._state['_token.auth0']
    return config
  })
  $axios.onError(error => {
    console.log(error)
    console.log('opps')
  })
}
