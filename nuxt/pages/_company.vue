<template>
  <main role="main" class="container">
    <header class="mb-1">
      <h2>COMPANY! Index</h2>
    </header>
    <Nuxt />
  </main>
</template>

<script>
import Vue from 'vue'

export default Vue.extend({
  data() {
    return {
      query: {
        keyword: "hoge2"
      }
    }
  },
  computed: {
    famlyName() {

    },
  },
})
</script>
