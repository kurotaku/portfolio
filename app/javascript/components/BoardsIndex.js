import React from "react"
import PropTypes from "prop-types"


function Board(props){
  return(
    <li key={props.key}>{props.board.id}</li>
  );
}

class BoardsIndex extends React.Component {
  constructor(props){
    super(props)
    this.state = {
      now: '',
      current_user: [],
      boards: [],
      selectedBoardId: 0
    };
    // this.getIndex = this.getIndex.bind(this)
  }

  componentDidMount(){
    this.getCurrentUser();
    this.getIndex();
    this.intervalId = setInterval(()=>{
      getIndex();
    }, 5000);
  }

  componentWillUnmount(){
    clearInterval(this.intervalId);
  }

  getCurrentUser(){
    fetch('/api/v1/current_user.json')
    .then(response => {return response.json()} )
    .then(data => {this.setState({ current_user: data })} )
    .catch(error => {
      console.log('GET CURRENTUSER ERROR:', error);
    });
  }

  getIndex(){
    fetch('/api/v1/boards.json')
    .then(response => {return response.json()} )
    .then(data => {this.setState({ boards: data })} )
    .catch(error => {
      console.log('GET INDEX ERROR:', error);
    });
  }

  render () {
    return (
      <React.Fragment>
        <ul className="post-list">
          {this.state.boards.map( board => {
            const isSelected = board.id === parseInt(this.state.selectedBoardId, 10);
            return(
              <Board
                key={board.id}
                board={board}
                isSelected={isSelected}
              />
            )
          })}
        </ul>
      </React.Fragment>
    );
  }
}

export default BoardsIndex
