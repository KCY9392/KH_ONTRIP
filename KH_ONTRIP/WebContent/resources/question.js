/**
 * 
 */

let sub = document.querySelector('.sub');
sub.addEventListener('click', () => getAlert());

function getAlert(seq) {
  Swal.fire({
    title: '등록되었습니다',
    icon: 'success',
    confirmButtonColor: '#3085d6',
    confirmButtonText: '확인'
  }).then(result => {
    if (result.isConfirmed) {
      WriteQue();
    }
  });
}

function getAlert2(seq) {
  Toast.fire({
    icon: 'info',
    title : '등록되었습니다'
  }).then(result => { if(result.isConfirmed) {
    WriteQue();}})
}




const Toast = Swal.mixin({
  toast: true,
  position: 'center-center',
  showConfirmButton: true,
  confirmButtonColor: '#3085d6',
  confirmButtonText: '확인',
  timerProgressBar: false
})







function WriteQue() {
  let queForm = document.sum;
  queForm.submit();
}