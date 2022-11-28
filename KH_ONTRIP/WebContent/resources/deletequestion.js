let sub = document.querySelector('.sub');
sub.addEventListener('click', () => getAlert2());

function getAlert(seq) {
  Swal.fire({
    title: '삭제하시겠습니까?',
    icon: 'waring',
    confirmButtonColor: '#3085d6',
    confirmButtonText: '확인',
    showCancelButton: true
  }).then(result => {
    if (result.isConfirmed) {
      Swal.fire({
        title: '삭제되었습니다',
        icon: 'info',
        confirmButtonColor: '#3085d6',
        confirmButtonText: '확인'
      }).then(result => {
        if (result.isConfirmed) {
          DeleteQue();
        }
      })
    }
  });
}

function getAlert2(seq) {
  const Toast = Swal.mixin({
    toast: true,
    position: 'center-center',
    showConfirmButton: true,
    confirmButtonColor: '#3085d6',
    timerProgressBar: false
  })

  Toast.fire({
    icon: 'warning',
    title: '삭제하시겠습니까?',
    showCancelButton: true,
    cancelButtonText: '취소',
    confirmButtonText: '삭제'
  }).then(result => {
    if (result.isConfirmed) {
      Toast.fire({
        title: '삭제되었습니다',
        icon: 'info',
        confirmButtonText: '확인'
      }).then(result => {
        if (result.isConfirmed) {
          DeleteQue();
        }
      })
    }
  })
}



function DeleteQue() {
  let deleteForm = document.deleteQue
  deleteForm.submit();
}


