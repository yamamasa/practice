<template>
  <header>
    <div>
      <b-navbar toggleable="lg" type="dark" variant="dark" fixed="top">
        <b-navbar-brand href="/">
          <fa-icon icon="cash-register" class="mr-2" />
          <strong>YEO</strong>
        </b-navbar-brand>

        <b-navbar-toggle target="nav-collapse"></b-navbar-toggle>

        <b-collapse id="nav-collapse" is-nav>
          <b-navbar-nav>
            <b-nav-item href="#">TBD</b-nav-item>
            <b-nav-item href="#" disabled>TBD</b-nav-item>
          </b-navbar-nav>

          <!-- Right aligned nav items -->
          <b-navbar-nav class="ml-auto" v-if="loggedIn">
            <b-nav-item right>
              {{famlyName}} さん
            </b-nav-item>
            <b-nav-item @click="logout">
              <fa-icon icon="sign-out-alt" class="mr-2" />
            </b-nav-item>
          </b-navbar-nav>
          <b-navbar-nav class="ml-auto" v-else>
            <b-nav-item @click="login" class="btn btn-primary btn-sm">
              ログイン
            </b-nav-item>
          </b-navbar-nav>

        </b-collapse>
      </b-navbar>
    </div>
  </header>
</template>

<script>
export default {
  computed: {
    loggedIn() {
      return this.$auth.loggedIn
    },
    famlyName() {
      // return this.$auth.loggedIn ? this.$auth.$state.user.nickname : 'ゲスト'
    },
  },
  created() {
      this.$axios.get('/api/v1/categories')
  },
  methods: {
    login() {
      this.$auth.loginWith('auth0')
    },
    async logout() {
      this.$auth.logout();
      const returnTo = encodeURIComponent(this.$config.baseURL)
      location.href = `https://${this.$config.auth0Domain}/v2/logout?returnTo=${returnTo}&client_id=${this.$config.auth0ClientId}`
    }
  }
};

</script>
