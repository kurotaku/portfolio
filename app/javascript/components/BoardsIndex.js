import React from "react"
import PropTypes from "prop-types"


function BoardMessageList(props){
  return(
    <div>
      <h1>とのメッセージ一覧</h1>
      <ul>
        {props.messages.map( message => {
          return(
            <li key={message.uuid}>{message.content}</li>
          )
        })}
      </ul>
    </div>
  )
}

function Board(props){
  return(
    <li
      key={props.key}
      onClick={ () => {
          props.selectBoard(props.board);
        }
      }
    >
      {props.board.id}
    </li>
  );
}

class BoardsIndex extends React.Component {
  constructor(props){
    super(props)
    this.INTERVAL = 60 * 1000
    this.state = {
      now: '',
      current_user: [],
      boards: [{uuid: ''}],
      messages: [],
      selectedBoard: 'default'
    };
    this.selectBoard = this.selectBoard.bind(this);
  }

  componentDidMount(){
    this.getCurrentUser();
    this.getBoardsIndex();
    this.getMessagesIndex(this.state.selectedBoard);
    this.intervalId = setInterval(()=>{
      this.getMessagesIndex(this.state.selectedBoard);
    }, this.INTERVAL);
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

  getBoardsIndex(){
    fetch('/api/v1/boards.json')
    .then(response => {return response.json()} )
    .then(data => {this.setState({ boards: data })} )
    .catch(error => {
      console.log('GET INDEX ERROR:', error);
    });
  }

  getMessagesIndex(board_uuid){
    fetch('/api/v1/messages.json?board_uuid=' + board_uuid)
    .then(response => {return response.json()} )
    .then(data => {this.setState({ messages: data })} )
    .catch(error => {
      console.log('GET INDEX ERROR:', error);
    });
  }

  selectBoard(board){
    console.log(board);
    this.setState(
      {selectedBoard: board}
    );
    clearInterval(this.intervalId);
    this.getMessagesIndex(board.uuid);
    this.intervalId = setInterval(()=>{
      this.getMessagesIndex(board.uuid);
    }, this.INTERVAL);
  }

  render () {
    return (
      <React.Fragment>
        <div className="main-content d-flex">
          <ul className="board-list">
            {this.state.boards.map( board => {
              const isSelected = board.id === parseInt(this.state.selectedBoardId, 10);
              return(
                <Board
                  key={board.uuid}
                  board={board}
                  selectBoard={this.selectBoard}
                />
              )
            })}
          </ul>
          <BoardMessageList
            messages={this.state.messages}
          />
        </div>
      </React.Fragment>
    );
  }
}

export default BoardsIndex
