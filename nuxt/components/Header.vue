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
          <b-navbar-nav class="ml-auto">

            <b-nav-item v-if="loggedIn" right>
              {{famlyName}} さん

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
      return this.$auth.loggedIn ? this.$auth.$state.user.nickname : 'ゲスト'
    },

  },
  methods: {
    logout() {
      this.$auth.logout();
    }
  }
};

</script>
