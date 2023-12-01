document.getElementById('gitUserForm').addEventListener('submit', function(event) {
  event.preventDefault();
  const gitLogin = document.getElementById('gitLogin').value;
  localStorage.setItem('gitLogin', gitLogin);
  window.location.href = 'result.html';
});
