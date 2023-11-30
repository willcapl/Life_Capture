import Rails from "@rails/ujs"

const initRecordVideo = () => {
  const start = document.getElementById("start");
  const stop = document.getElementById("stop");
  const live = document.getElementById("live");
  const form = document.querySelector("form");
  const videoButtons = document.querySelector(".video-btns")
  const recordVideoID = form.dataset.recordVideoId
  const subUserID = form.dataset.subUserId
  const url = `/sub_users/${subUserID}/questions/${recordVideoID}`

  const uploadToCloudinary = (video) => {
    const formData = new FormData(form);
    formData.append('question[video]', video, "my_video.mp4" )
    console.log(formData)
    Rails.ajax({
      url: url,
      type: 'PATCH',
      data: formData
    })
    // form.submit();
  }

  const stopVideo = () => {
    live.srcObject.getTracks().forEach(track => track.stop());
  }
  // stop.addEventListener("click", stopVideo);

  const stopRecording = () => {
    return new Promise(resolve => stop.addEventListener("click", resolve));
  }
  const startRecording = (stream) => {
    const recorder = new MediaRecorder(stream);
    let data = [];
  recorder.ondataavailable = event => data.push(event.data);
    recorder.start();
  const stopped = new Promise((resolve, reject) => {
      recorder.onstop = resolve;
      recorder.onerror = event => reject(event.name);
    });
  const recorded = stopRecording().then(
      () => {
        stopVideo();
        recorder.state == "recording" && recorder.stop();
      }
    );
  return Promise.all([
      stopped,
      recorded
    ])
    .then(() => data);
  }
  stop.addEventListener("click", () => {
    stop.classList.add('d-none')
    videoButtons.classList.remove('d-none')
  } )
  start.addEventListener("click", () => {
    start.classList.add('d-none')
    navigator.mediaDevices.getUserMedia({
      video: true,
      audio: true
    })
    .then(stream => {
      live.srcObject = stream;
      live.captureStream = live.captureStream || live.mozCaptureStream;
      return new Promise(resolve => live.onplaying = resolve);
    })
    .then(() => startRecording(live.captureStream()))
    .then (recordedChunks => {
      const recordedBlob = new Blob(recordedChunks, { type: "video/mp4" });
      console.log(recordedBlob);
      uploadToCloudinary(recordedBlob);
    })
  });
}
export { initRecordVideo };



    //  const url = `/sub_users/${subUserID}/questions/${recordVideoID}`
    //   const content = {
    //     method: "PATCH",
    //     headers: { "Content-Type": "application/json", "X-CSRF-Token": Rails.csrfToken() },
    //     body: new FormData(form).append(recordedBlob, 'video/webm')
    //   }
    //   fetch(url, content)
    //   .then(response => response)
    //   .then(data => console.log(data))
