import React, { Component } from 'react';

import Page from '../page/Page';
import CurrencyTable from '../currencyTable/CurrencyTableContainer';
import Comment from '../comment/CommentContainer';
import AddComment from '../addComment/AddCommentContainer';

class EquipmentPage extends Component {
  constructor(props) {
    super(props);
    this.state = {
      base: ''
    };
  }

  componentWillMount() {
    const { match } = this.props;
    const { base } = match.params;
    this.setState({
      base
    });
    const { getEquipmentComments } = this.props;
    getEquipmentComments(base);
  }

  render() {
    const { base } = this.state;
    const { comments } = this.props;

    return (
      <Page>
        <div>
          <CurrencyTable base={base}></CurrencyTable>
        </div>

        <div>
          {comments &&
            comments.map((comment) => (
              <Comment
                author={comment.user.username}
                content={comment.content}
                createdAt={comment.created_at.substring(0, 10)}
                image={comment.image}
                commentId={comment.id}
                articleId={comment.article}
                authorURL={comment.user.url}
              />
            ))}
        </div>
        <div className="create-comment">
          <AddComment />
        </div>
      </Page>
    );
  }
}
export default EquipmentPage;
