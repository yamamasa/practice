<template>
  <div class="container">
{{$config.baseURL}}



  </div>
</template>

<script>
export default {
  created() {
    this.$axios
      .get(`${this.$config.apiURL}/api/v1`)
      .then(response => {

      })
  }
}
</script>
