function editUser(user_id) {
    alert(user_id + " 수정 기능 구현 예정");
}

function deleteUser(user_id) {
    if (confirm("정말로 삭제하시겠습니까?")) {
        fetch(`/admin/users/delByAdmin/${user_id}`, {
            method: 'DELETE'
        })
        .then(res => res.text())
        .then(result => {
            alert(result);
            location.reload();
        });
    }
}
