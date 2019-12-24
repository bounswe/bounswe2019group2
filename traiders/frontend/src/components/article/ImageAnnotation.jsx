import React, { useState } from 'react';
import styled, { keyframes } from 'styled-components';
import Annotation from 'react-image-annotation';
import { Input, Button } from 'antd';

import './image-annotation.scss';

import { handleFileUpload } from './AnnotationHelperFunctions';
import { PostWithUrlBody } from '../../common/http/httpUtil';
import history from '../../common/history';

const ANNOTATION_URL = 'https://annotation.traiders.tk/annotations/';

const fadeInScale = keyframes`
  from {
    opacity: 0;
    transform: scale(0);
  }
  to {
    opacity: 1;
    transform: scale(1);
  }
`;

const Container = styled.div`
  background: white;
  border-radius: 2px;
  box-shadow: 0px 1px 5px 0px rgba(0, 0, 0, 0.2),
    0px 2px 2px 0px rgba(0, 0, 0, 0.14), 0px 3px 1px -2px rgba(0, 0, 0, 0.12);
  margin-top: 16px;
  transform-origin: top left;
  animation: ${fadeInScale} 0.31s cubic-bezier(0.175, 0.885, 0.32, 1.275);
  overflow: hidden;
`;

const ImageAnnotation = ({
  src,
  article,
  user,
  getArticleAnnotations,
  annotationList
}) => {
  const [annotations, setAnnotations] = useState([]);
  const [annotation, setAnnotation] = useState({});
  const [annotationTextInput, setAnnotationTextInput] = useState(null);
  const [url, setUrl] = useState(null);
  const [disableEditor, setDisableEditor] = useState(false);

  const onSubmit = (annotationTemp) => {
    const { geometry, data } = annotationTemp;

    setAnnotation({});
    setAnnotations(
      annotations.concat({
        geometry,
        data: {
          ...data,
          id: Math.random()
        }
      })
    );
  };

  const onChange = (annotationTemp) => {
    setAnnotation(annotationTemp);
  };

  const submitAnnotationText = () => {
    const { x, y, width, height } = annotation.geometry;

    const body = {
      type: 'TextualBody',
      value: annotationTextInput
    };
    const target = {
      source: article.image,
      selector: {
        value: `xywh=${x.toFixed(2)},${y.toFixed(2)},${width.toFixed(
          2
        )},${height.toFixed(2)}`
      }
    };
    const creator = user.user.url;

    PostWithUrlBody(ANNOTATION_URL, { body, target, creator })
      // eslint-disable-next-line no-console
      .then((response) => console.log(response))
      // eslint-disable-next-line no-console
      .catch((error) => console.log('Error while adding annotation', error));

    setTimeout(() => getArticleAnnotations(), 1000);
    setDisableEditor(true);
  };

  const getFilteredAnnotationList = () => {
    const filteredAnnationList =
      annotationList &&
      annotationList.filter(
        (element) => element.target.source === article.image
      );

    const finalList = filteredAnnationList
      ? filteredAnnationList.map((element) => {
          const eqIndex = element.target.selector.value.indexOf('=') + 1;
          const [x, y, width, height] = element.target.selector.value
            .substring(eqIndex)
            .split(',');

          /*
          const { creator } = element;
          const userId = creator.split('/')[creator.split('/').length - 2];
          let user;
          GetWithUrl(`https://api.traiders.tk/users/${userId}`)
            .then((response) => response.json().then((res) => (user = res)))
            .catch((error) =>
              // eslint-disable-next-line no-console
              console.log('Error while fetching annotation owner', error)
            );
          */

          return {
            geometry: {
              type: 'RECTANGLE',
              x: parseFloat(x),
              y: parseFloat(y),
              width: parseFloat(width),
              height: parseFloat(height)
            },
            data: {
              text: element.body.value ? element.body.value : element.body.id,
              id: Math.random(),
              val: element
            }
          };
        })
      : [];

    return finalList;
  };

  const submitAnnotationImage = () => {
    const { x, y, width, height } = annotation.geometry;
    const body = { type: 'Image', id: url };
    const target = {
      source: article.image,
      selector: {
        value: `xywh=${x.toFixed(2)},${y.toFixed(2)},${width.toFixed(
          2
        )},${height.toFixed(2)}`
      }
    };

    const creator = user.user.url;

    PostWithUrlBody(ANNOTATION_URL, { body, target, creator })
      // eslint-disable-next-line no-console
      .then((response) => console.log(response))
      // eslint-disable-next-line no-console
      .catch((error) => console.log('Error while adding annotation', error));

    setTimeout(() => getArticleAnnotations(), 1000);

    setDisableEditor(true);
  };

  const RenderEditor = () => {
    const { geometry } = annotation;
    setDisableEditor(false);
    return (
      <Container
        style={{
          position: 'absolute',
          left: `${geometry.x}%`,
          top: `${geometry.y + geometry.height}%`
        }}
      >
        {user ? (
          <div className="image-add-annotation-container">
            <div className="add-annotation-container">
              <div className="add-annotate-title">TEXT MESSAGE</div>
              <div className="add-text-container">
                <Input.TextArea
                  placeholder="Type here to annotate"
                  onChange={(event) =>
                    setAnnotationTextInput(event.target.value)
                  }
                />
              </div>
              <div className="annotation-submit-button">
                <Button type="primary" onClick={submitAnnotationText}>
                  Submit
                </Button>
              </div>
              <div className="add-annotation-image">IMAGE MESSAGE</div>
              <div className="add-image-container">
                <Input
                  type="file"
                  className="form-control"
                  aria-describedby="basic-addon1"
                  accept="image/png, image/jpeg"
                  onChange={(event) => handleFileUpload(event, setUrl)}
                />
              </div>
              <div className="annotation-submit-button">
                <Button type="primary" onClick={submitAnnotationImage}>
                  Submit
                </Button>
              </div>
            </div>
          </div>
        ) : (
          <Button type="primary" onClick={() => history.push('/login')}>
            LOGIN
          </Button>
        )}
      </Container>
    );
  };

  const RenderContent = (props) => {
    // eslint-disable-next-line no-shadow
    const { annotation } = props;
    const { geometry } = annotation;
    const currentAnnotation = annotation.data.val;

    const type = currentAnnotation.body.value ? 'TextualBody' : 'Image';
    const source = currentAnnotation.body.id;

    return (
      <Container
        style={{
          position: 'absolute',
          left: `${geometry.x}%`,
          top: `${geometry.y + geometry.height}%`,
          // eslint-disable-next-line react/destructuring-assignment
          ...props.style
        }}
        geometry={geometry}
      >
        {type === 'Image' ? (
          <div>
            <img
              alt={source}
              src={source}
              style={{ width: 200, height: 200 }}
            />
          </div>
        ) : (
          <div>{annotation.data.text}</div>
        )}
      </Container>
    );
  };

  return (
    <div>
      <Annotation
        src={src}
        alt={src}
        annotations={getFilteredAnnotationList()}
        value={annotation}
        onChange={onChange}
        onSubmit={onSubmit}
        renderEditor={RenderEditor}
        disableEditor={disableEditor}
        renderContent={RenderContent}
      />
    </div>
  );
};

export default ImageAnnotation;
