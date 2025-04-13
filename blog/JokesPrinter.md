---
layout: post
title: "Joke Printer"
title2: "Joke Printer"
loc: blog
latex: false
date: 2025-04-13
---
<style>
.joke{
    background-color: #233e32;
    text-align: center;
    border-radius: 5px;
    padding: 10px;
    margin: 10px 0;
}
.joke:hover {
    background-color: #2a4b3c;
}
button {
    background-color: #233e32; /* Green */
    border-radius: 5px;
    color: white;
    padding: 10px 20px;
    text-align: center;
    display: block;
    width: 20%;
    margin:auto 40% auto;
}
</style>
<h1 style="text-align: center;">Jokes Printer 😂</h1>
<div id="jokes">Loading jokes...</div>
 <button onclick="window.location.href='/blog/JokesSelector'">Select Joke Amount</button>
<script>
  const urlParams = new URLSearchParams(window.location.search);
  const jokeAmount = urlParams.get('amount') || 3;
  const jokeContainer = document.getElementById("jokes");

  fetch(`https://v2.jokeapi.dev/joke/Any?blacklistFlags=nsfw,explicit&type=single&amount=${jokeAmount}`)
    .then(response => {
      if (!response.ok) {
        throw new Error(`HTTP error! Status: ${response.status}`);
      }
      return response.json();
    })
    .then(data => {
      jokeContainer.innerHTML = "";
    
      if (data.error) {
        jokeContainer.textContent = "API Error: " + data.message;
        return;
      }

      const jokes = data.jokes || [data];
      jokes.forEach(jokeObj => {
        const jokeDiv = document.createElement("div");
        jokeDiv.className = "joke";
        const formattedJoke = jokeObj.joke.replace(/\n/g, "<br>");
        jokeDiv.innerHTML = formattedJoke;
        jokeContainer.appendChild(jokeDiv);
      });
    })
    .catch(error => {
      jokeContainer.textContent = "Error fetching jokes: " + error.message;
      console.error("Fetch error:", error);
    });
</script>