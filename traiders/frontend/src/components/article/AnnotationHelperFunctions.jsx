import * as firebase from 'firebase';

export const handleCreatingHighlightedContent = (article, annotationList) => {
  let articleWithHtml = article;

  if (annotationList) {
    annotationList.forEach((annotation) => {
      const eqIndex = annotation.target.selector.value.indexOf('=') + 1;
      const ranges = annotation.target.selector.value
        .substring(eqIndex)
        .split(',');
      const substring = article.substring(ranges[0], ranges[1]);
      if (annotation.body.value) {
        const htmlContent = `<span type="TextualBody" id=${annotation.id} style='background-color: green; cursor:pointer;'>${substring}</span>`;
        articleWithHtml = articleWithHtml.replace(substring, htmlContent);
      } else {
        const htmlContent = `<span type="Image" value=${annotation.body.id} id=${annotation.id} style='background-color: green; cursor:pointer;'>${substring}</span>`;
        articleWithHtml = articleWithHtml.replace(substring, htmlContent);
      }
    });
  }

  return articleWithHtml;
};

export const handleFileUpload = (event, saveUrl) => {
  const file = event.target.files[0];

  const path = `${file.lastModified}-${file.name}`;
  // Create a storage ref
  const storageRef = firebase.storage().ref(path);

  // Upload file
  const task = storageRef.put(file);

  // Update progress
  task.on(
    'state_changed',
    function progress(snapshot) {
      const percentage =
        (snapshot.bytesTransferred / snapshot.totalBytes) * 100;
      // eslint-disable-next-line no-console
      console.log('File upload... ', percentage);
    },
    function error(err) {
      // eslint-disable-next-line no-console
      console.log('Error when uploading file', err);
    },
    function complete() {
      // eslint-disable-next-line no-console
      console.log('File upload completed on path: ');
      task.snapshot.ref.getDownloadURL().then((url) => saveUrl(url));
    }
  );
};

export const handleSelectingPixels = (event) => {
  console.log(event.target);
  console.log(window.getSelection());
};
