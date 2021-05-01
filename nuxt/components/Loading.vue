<template>
  <div>
    <div class="loading d-flex justify-content-center align-items-center mt-5">
      <div class="col-12 col-md-6">
        <b-card class="text-center">
          {{ message }}
          <img src="~/static/loading.svg" class="mt-0" />
        </b-card>
      </div>
    </div>
  </div>
</template>

<script>
  export default {
    props: {
      message: {
        type: Number,
        default: '処理中です。しばらくお待ちください。'
      },
    }

  }
</script>
