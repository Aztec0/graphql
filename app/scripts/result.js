document.addEventListener('DOMContentLoaded', function() {
  const gitLogin = localStorage.getItem('gitLogin');

  if (gitLogin) {
    getGitUserInfo(gitLogin);
  } else {
    console.error('GitHub login not found in localStorage.');
  }
});

async function getGitUserInfo(gitLogin) {
  const response = await fetch('/graphql', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    },
    body: JSON.stringify({
      query: `
        query {
          git_user(git_login: "${gitLogin}") {
            name
            repos
          }
        }
      `,
    }),
  });

  const result = await response.json();

  // Assuming the response format matches the expected format
  const userInfo = result.data.git_user;

  // Display the user information
  displayUserInfo(userInfo);
}

function displayUserInfo(userInfo) {
  const userInfoDiv = document.getElementById('userInfo');
  userInfoDiv.innerHTML = `
    <h2>User Information</h2>
    <p>Name: ${userInfo.name}</p>
    <p>Repos: ${userInfo.repos.join(', ')}</p>
  `;
}
