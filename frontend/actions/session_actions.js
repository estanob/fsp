import * as APIUtil from '../util/session_api_util';

export const RECEIVE_CURRENT_USER = 'RECEIVE_CURRENT_USER';
export const RECEIVE_SESSION_ERRORS = 'RECEIVE_SESSION_ERRORS';

export const receiveCurrentUser = currentUser => {
  return {
    type: RECEIVE_CURRENT_USER,
    currentUser
  };
};

export const receiveErrors = errors => {
  return {
    type: RECEIVE_SESSION_ERRORS,
    errors
  };
};

export const register = user => dispatch => {
  return APIUtil.register(user)
    .then(user => dispatch(receiveCurrentUser(user)))
    .fail(err => dispatch(receiveErrors(err.responseJSON)))
};

export const login = user => dispatch => {
  return APIUtil.login(user)
    .then(user => dispatch(login(user)))
    .fail(err => dispatch(receiveErrors(err.responseJSON)))
};

export const logout = () => dispatch => {
  return APIUtil.logout()
    .then(user => {dispatch(receiveCurrentUser(null))})
};