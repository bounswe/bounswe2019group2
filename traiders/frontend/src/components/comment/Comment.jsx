import React from 'react';
import './comment.scss';

const Comment = (props) => {
  const { author, createdAt, content, image } = props;

  return (
    <div className="comment-container">
      <div className="comment-author">{author}</div>
      <div className="comment-image">{image}</div>
      <div className="comment-content">{content} </div>
      <div className="comment-datetime">{createdAt}</div>
    </div>
  );
};

export default Comment;
