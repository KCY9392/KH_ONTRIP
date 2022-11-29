let deleteButton = document.querySelector('.update');
deleteButton.addEventListener('click', () => getAlert());

function getAlert(seq) {
  Swal.fire({
    title: '수정되었습니다',
    icon: 'info',
    confirmButtonColor: '#3085d6',
    confirmButtonText: '확인'
  }).then(result => {
    if (result.isConfirmed) {
      UpdateQue();
    }
  });
}


function UpdateQue() {

  let updateForm = document.updateForm
  updateForm.submit();

}


function getAlert2(seq) {
  Toast.fire({
    icon: 'info',
    title : '수정되었습니다'
  }).then(result => { if(result.isConfirmed) {
    UpdateQue();}})
}




const Toast = Swal.mixin({
  toast: true,
  position: 'center-center',
  showConfirmButton: true,
  confirmButtonColor: '#3085d6',
  confirmButtonText: '확인',
  timerProgressBar: false
})
