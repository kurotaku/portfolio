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
    this.INTERVAL = 60 * 1000;
    this.state = {
      now: '',
      current_user: [],
      boards: [{uuid: ''}],
      messages: [],
      form: {
        content: ''
      },
      selectedBoard: {uuid: 'default'}
    };
    fetch('/api/v1/boards.json')
    .then(response => {return response.json()} )
    .then(data => {this.setState({ selectedBoard: data[0] })} );
    this.selectBoard = this.selectBoard.bind(this);
  }

  componentDidMount(){
    this.getCurrentUser();
    this.getBoardsIndex();
    this.getMessagesIndex(this.state.selectedBoard.uuid);
    this.intervalId = setInterval(()=>{
      this.getMessagesIndex(this.state.selectedBoard.uuid);
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
    this.setState(
      {selectedBoard: board}
    );
    clearInterval(this.intervalId);
    this.getMessagesIndex(board.uuid);
    this.intervalId = setInterval(()=>{
      this.getMessagesIndex(board.uuid);
    }, this.INTERVAL);
  }

  handleChange(e, key){
    let target = e.target;
    let value = target.value;
    let form = this.state.form;
    form[key] = value;

    this.setState({
      form: form
    });
  }

  handleCreate(){
    let body = JSON.stringify({
      message: {
        board_id: this.state.selectedBoard.id,
        content: this.state.form.content
      }
    })
    
    fetch('/api/v1/messages', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: body
    })
    .then(response => {
      return response.json()
    })
    .then(message => {
      this.addMessage(message);
      this.formReset();
    })
    .catch( error => {
      console.log('CREATE ERROR:', error);
    })
  }

  addMessage(message){
    this.setState({
      messages: this.state.messages.concat(message)
    })
  }

  formReset(){
    this.setState({
      form: {
        content: ""
      },
      // editForm: {
      //   uuid: false
      // }
    })
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
          <div>
            <BoardMessageList
              messages={this.state.messages}
            />
            <input type="text" value={this.state.form.content} onChange={ e => this.handleChange(e, 'content')} />
            <button onClick={() => this.handleCreate()}>投稿</button>
          </div>
        </div>
      </React.Fragment>
    );
  }
}

export default BoardsIndex
