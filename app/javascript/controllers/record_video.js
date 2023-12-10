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
  const recordMessage = document.querySelector('.recording-now-alert')

  const uploadToCloudinary = (video) => {
    const formData = new FormData(form);
    formData.append("question[video]", video, "my_video.webm" )
    formData.append("resource_type", "video" )
    console.log(formData)
    Rails.ajax({
      url: url,
      type: 'PATCH',
      data: formData
    })
  }

  const stopVideo = () => {
    live.srcObject.getTracks().forEach(track => track.stop());
  }

  const takeScreenshot = (videoElement) => {
    const canvas = document.createElement('canvas');
    canvas.width = videoElement.videoWidth;
    canvas.height = videoElement.videoHeight;
    const context = canvas.getContext('2d');
    context.drawImage(videoElement, 0, 0, canvas.width, canvas.height);
    return new Promise((resolve) => {
      canvas.toBlob(resolve, 'image/jpeg');
    });
  };

  const stopRecording = () => {
    return new Promise(resolve => stop.addEventListener("click", resolve));
  }
  const startRecording = (stream) => {
    const options = { mimeType: "video/webm;codecs=vp9", audioBitsPerSecond: 128000, videoBitsPerSecond: 2500000 };
    const recorder = new MediaRecorder(stream, options);
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
    recordMessage.classList.add('d-none')
    videoButtons.classList.remove('d-none')
  } )
  start.addEventListener("click", () => {
    start.classList.add('d-none')
    recordMessage.classList.remove('d-none')
    navigator.mediaDevices.getUserMedia({
      video: true,
      audio: true
    })
    .then(stream => {
      live.srcObject = stream;
      live.captureStream = live.captureStream || live.mozCaptureStream;
      console.log('start');
      setTimeout(() => {
        takeScreenshot(live).then((screenshotBlob) => {
          const formData = new FormData(form);
          console.log('thumbnail', screenshotBlob);
          formData.append("question[video_thumbnail]", screenshotBlob, "my_video_thumbnail.jpg");
          // Upload the screenshot
          Rails.ajax({
            url: url,
            type: 'PATCH',
            data: formData
          });
        });
        console.log('stop');
      }, 2000);
      return new Promise(resolve => live.onplaying = resolve);
    })
    .then(() => startRecording(live.captureStream()))
    .then (recordedChunks => {
      const recordedBlob = new Blob(recordedChunks, { type: "video/mp4" });
      console.log(recordedBlob);
      uploadToCloudinary(recordedBlob);
    });
    })

}
export { initRecordVideo };
