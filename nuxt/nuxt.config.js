export default {
  // Disable server-side rendering: https://go.nuxtjs.dev/ssr-mode
  ssr: false,

  // Target: https://go.nuxtjs.dev/config-target
  target: 'static',

  publicRuntimeConfig: {
    baseURL: process.env.BASE_URL,
    apiURL: process.env.API_URL,
    auth0Domain: process.env.AUTH0_DOMAIN,
    auth0ClientId: process.env.AUTH0_CLIENT_ID

  },

  // Global page headers: https://go.nuxtjs.dev/config-head
  head: {
    title: 'YEO',
    htmlAttrs: {
      lang: 'ja'
    },
    meta: [
      { charset: 'utf-8' },
      { name: 'viewport', content: 'width=device-width, initial-scale=1' },
      { hid: 'description', name: 'description', content: '' }
    ],
    link: [
      { rel: 'icon', type: 'image/x-icon', href: '/favicon.ico' }
    ]
  },

  // Global CSS: https://go.nuxtjs.dev/config-css
  css: [
    '@/assets/scss/style.scss'
  ],

  // Plugins to run before rendering page: https://go.nuxtjs.dev/config-plugins
  plugins: [
    '@/plugins/axios'
  ],

  // Auto import components: https://go.nuxtjs.dev/config-components
  components: true,

  // Modules for dev and build (recommended): https://go.nuxtjs.dev/config-modules
  buildModules: [
    '@nuxtjs/pwa',
    'bootstrap-vue/nuxt',
    ['@nuxtjs/fontawesome', {
      component: 'fa',
      suffix: true,
      icons: {
        solid: true,
        regular: true,
        brands: true
      }
    }]
  ],

  // Modules: https://go.nuxtjs.dev/config-modules
  modules: [
    // https://go.nuxtjs.dev/bootstrap
    'bootstrap-vue/nuxt',
    '@nuxtjs/axios',
    '@nuxtjs/auth'
  ],

  // Build Configuration: https://go.nuxtjs.dev/config-build
  build: {
    loadingScreen: false,
    hardSource: true,
    babel: {
      plugins: [
        [
          "@babel/plugin-proposal-private-methods",
          {
            "loose": true
          }
        ]
      ]
    }
  },
  devServer: {
    disableHostCheck: true
  },

  manifest: {
    name: "YEO",
    title: "PRODUCT YEO",
    lang: 'ja',
    theme_color: "#0026ff",
    background_color: "#ffd700",
    display: "standalone",
    scope: "/",
    start_url: "/"
  },

  auth: {
    strategies: {
      auth0: {
        domain: process.env.AUTH0_DOMAIN,
        client_id: process.env.AUTH0_CLIENT_ID,
        response_type: 'id_token',
        token_key: 'id_token',
        userinfo_endpoint: false,
        endpoints: {
          logout: `https://${process.env.AUTH0_DOMAIN}/v2/logout`
        }
      },
    },
    redirect: {
      login: '/login',  // ??????????????????????????????????????????
      logout: '/logout',  // ??????????????????????????????????????????????????????????????????
      callback: '/callback',  // ??????????????????URL
      home: '/mypage',  // ???????????????????????????????????????
    },
  },
  router: {
    middleware: ['auth']
  },
  watchers: {
    webpack: {
        poll: true
    }
  }
}
