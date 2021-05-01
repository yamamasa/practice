<template>
  <div class="container has-text-centered mt-6">
    <div>
      <h1 class="title">sample-nuxt-auth</h1>
      <h2 class="subtitle">ログインページ</h2>
      <button class="button is-dark is-large" @click="loginWithAuthZero">
        Auth0でログイン
      </button>
    </div>
  </div>
</template>

<script lang="ts">
import Vue from 'vue'

export default Vue.extend({
  auth: false,
  methods: {
    loginWithAuthZero() {
      this.$auth.loginWith('auth0')
    },
  },
})
</script>
