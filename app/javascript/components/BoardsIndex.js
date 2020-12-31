import React from "react"
import PropTypes from "prop-types"
class BoardsIndex extends React.Component {
  constructor(props){
    super(props)
    this.state = {
      current_user: [],
      boards: [],
    };
    // this.getIndex = this.getIndex.bind(this)
  }

  componentDidMount(){
    this.getIndex();
    this.getCurrentUser();
  }

  getIndex(){
    fetch('/api/v1/boards.json')
    .then(response => {return response.json()} )
    .then(data => {this.setState({ boards: data })} )
    .catch(error => {
      console.log('GET INDEX ERROR:', error);
    });
  }

  getCurrentUser(){
    fetch('/api/v1/current_user.json')
    .then(response => {return response.json()} )
    .then(data => {this.setState({ current_user: data })} )
    .catch(error => {
      console.log('GET CURRENTUSER ERROR:', error);
    });
  }

  render () {
    return (
      <React.Fragment>
        <ul className="post-list">
          {this.state.boards.map( board => {
            return(
              <p>{board.id}</p>
            )
          })}
        </ul>
      </React.Fragment>
    );
  }
}

export default BoardsIndex
