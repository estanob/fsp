import React from 'react';
import { connect } from 'react-redux';
import SessionForm from './session_form';
import { closeModal, openModal } from '../../actions/modal_actions';

const mSTP = state => {
  return {
    errors: Object.values(state.errors.session),
    formType: 'register'
  };
};

const mDTP = dispatch => {
  return {
    processForm: user => dispatch(register(user)),
    otherForm: (
      <button onClick={() => dispatch(openModal('login'))}>
        Login
      </button>
    ),
    closeModal: () => dispatch(closeModal()),
    clearErrors: () => dispatch(clearErrors())
  };
};

export default connect(mSTP, mDTP)(SessionForm)