import { API } from '../apiConfig';
import { GetWithUrl } from '../../common/http/httpUtil';

/* Action Types */

const SAVE_EQUIPMENT_COMMENTS = 'SAVE_EQUIPMENT_COMMENTS';
const SAVE_SINGLE_COMMENT = 'SAVE_SINGLE_COMMENT';
const SAVE_SINGLE_EQUIPMENT = 'SAVE_SINGLE_EQUIPMENT';

export const actionTypes = {
  SAVE_EQUIPMENT_COMMENTS,
  SAVE_SINGLE_COMMENT,
  SAVE_SINGLE_EQUIPMENT
};
/* Action Creators */

function saveSingleEquipment(equipment) {
  return {
    type: SAVE_SINGLE_EQUIPMENT,
    payload: equipment
  };
}

function saveSingleComment(comment) {
  return {
    type: SAVE_SINGLE_COMMENT,
    payload: comment
  };
}

function saveEquipmentComments(commentsList) {
  return {
    type: SAVE_EQUIPMENT_COMMENTS,
    payload: commentsList
  };
}

export const actionCreators = {
  saveEquipmentComments,
  saveSingleComment,
  saveSingleEquipment
};

/* Api Call Functions */

export const getEquipment = (base) => {
  return (dispatch) => {
    return dispatch(saveSingleEquipment(base));
  };
};

export const getComment = (id) => {
  return (dispatch) => {
    GetWithUrl(`${API}/comments/equipment/${id}/`)
      .then((response) => {
        if (response.status === 200) {
          response.json().then((res) => {
            return dispatch(saveSingleComment(res));
          });
        }
      })
      // eslint-disable-next-line no-console
      .catch((error) => console.log('Error while fetching comment\n', error));
  };
};

export const getEquipmentComments = (base) => {
  return (dispatch) => {
    GetWithUrl(`${API}/comments/equipment/?equipment=${base}`)
      .then((response) => {
        if (response.status === 200) {
          response.json().then((res) => dispatch(saveEquipmentComments(res)));
        }
      })

      .catch((error) =>
        // eslint-disable-next-line no-console
        console.log('Error while fetching equipment comments\n', error)
      );
  };
};
