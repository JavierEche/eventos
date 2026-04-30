const videos = [
  { id: "ysz5S6PUM-U", title: "Demo UI moderna", channel: "Canal Dev" },
  { id: "aqz-KE-bpKQ", title: "Big Buck Bunny (tráiler)", channel: "Blender" },
  { id: "ScMzIvxBSi4", title: "Música LoFi para codificar", channel: "Focus Beats" },
  { id: "dQw4w9WgXcQ", title: "Classic Pop", channel: "RickAstleyVEVO" },
];

const player = document.getElementById("player");
const playlist = document.getElementById("playlist");
const title = document.getElementById("video-title");
const channel = document.getElementById("video-channel");
const search = document.getElementById("search");

function render(list) {
  playlist.innerHTML = "";
  list.forEach((video, idx) => {
    const li = document.createElement("li");
    li.className = "video-item";
    li.innerHTML = `
      <img src="https://img.youtube.com/vi/${video.id}/mqdefault.jpg" alt="${video.title}">
      <div>
        <strong>${video.title}</strong>
        <p>${video.channel}</p>
      </div>
    `;

    li.addEventListener("click", () => selectVideo(video, li));
    if (idx === 0) selectVideo(video, li);
    playlist.appendChild(li);
  });
}

function selectVideo(video, element) {
  document.querySelectorAll(".video-item").forEach((node) => node.classList.remove("active"));
  element?.classList.add("active");
  player.src = `https://www.youtube.com/embed/${video.id}`;
  title.textContent = video.title;
  channel.textContent = video.channel;
}

search.addEventListener("input", (e) => {
  const value = e.target.value.toLowerCase();
  const filtered = videos.filter((v) =>
    v.title.toLowerCase().includes(value) || v.channel.toLowerCase().includes(value)
  );
  render(filtered);
});

render(videos);
