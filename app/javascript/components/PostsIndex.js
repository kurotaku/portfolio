import React from "react"
import PropTypes from "prop-types"
class PostsIndex extends React.Component {
  constructor(props){
    super(props)
    this.state = {
      current_user: [],
      posts: [],
      form: {
        content: ''
      },
      editForm: {
        uuid: false,
        content: ''
      }
    };
    // this.getIndex = this.getIndex.bind(this)
    // this.handleDelete = this.handleDelete.bind(this)
    // this.deletePost = this.deletePost.bind(this)
    // this.handleChange = this.handleChange.bind(this)
    // this.addPost = this.addPost.bind(this)
    // this.formReset = this.formReset.bind(this)
  }

  // componentDidMount(){
  //   this.setState({
  //     posts: this.props.posts
  //   })
  // }

  componentDidMount(){
    this.getIndex();
    this.getCurrentUser();
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
    fetch('/api/v1/posts.json')
    .then(response => {return response.json()} )
    .then(data => {this.setState({ posts: data })} );
  }

  handleDelete(uuid){
    fetch(`/api/v1/posts/${uuid}`, {
      method: 'DELETE',
      headers: {
        'Content-Type': 'application/json'
      }
    })
    .then(response => {
      this.deletePost(uuid);
    })
    .catch( error => {
      console.log('DELETE ERROR:', error);
    })
  }

  deletePost(uuid){
    let posts = this.state.posts.filter(post => post.uuid != uuid)
    this.setState({
      posts: posts
    })
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

  handleChangeEdit(uuid, e, key){
    let target = e.target;
    let value = target.value;
    let editForm = this.state.editForm;
    editForm[key] = value;
    editForm['uuid'] = uuid;

    this.setState({
      editForm: editForm
    });
  }

  handleCreate(){
    let body = JSON.stringify({
      post: {
        content: this.state.form.content
      }
    })
    
    fetch('/api/v1/posts', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: body
    })
    .then(response => {
      return response.json()
    })
    .then(post => {
      this.addPost(post);
      this.formReset();
    })
    .catch( error => {
      console.log('CREATE ERROR:', error);
    })
  }

  addPost(post){
    this.setState({
      posts: this.state.posts.concat(post)
    })
  }

  formReset(){
    this.setState({
      form: {
        content: ""
      },
      editForm: {
        uuid: false
      }
    })
  }

  handleEdit(post){
    this.setState({
      editForm: {
        uuid: post.uuid,
        content: post.content
      }
    })
    console.log(this.state.editForm.uuid);
  }

  handleUpate(post){
    let body = JSON.stringify({
      post: {
        content: this.state.editForm.content
      }
    })
    
    fetch(`/api/v1/posts/${post.uuid}`, {
      method: 'PATCH',
      headers: {
        'Content-Type': 'application/json'
      },
      body: body
    })
    .then(response => {
      return response.json()
    })
    .then(post => {
      this.formReset();
      this.getIndex();
    })
    .catch( error => {
      console.log('UPDATE ERROR:', error);
    })
  }

  render () {
    return (
      <React.Fragment>
        <ul className="post-list">
          {this.state.posts.map( post => {
            var user_path = '/users/' + post.user.uuid
            if(this.state.current_user.uuid == post.user.uuid && this.state.editForm.uuid != post.uuid){
              return(
                <li key={post.uuid} className="poat-list-item">
                  <div>
                    <a href={user_path}>@{post.user.name}</a><br />
                    {post.content}
                  </div>
                  <button className="ml-auto border-btn text-danger" onClick={() => this.handleEdit(post)}>編集</button>
                  <button className="border-btn text-danger" onClick={() => this.handleDelete(post.uuid)}>削除</button>
                </li>
              );
            }
            else if(this.state.current_user.uuid == post.user.uuid && this.state.editForm.uuid == post.uuid){
              return(
                <li key={post.uuid} className="poat-list-item">
                  <input type="text" value={this.state.editForm.content} onChange={ e => this.handleChangeEdit(post.uuid, e, 'content')} />
                  
                  <button className="ml-auto border-btn text-danger" onClick={() => this.handleUpate(post)}>更新</button>
                  <button className="border-btn text-danger" onClick={() => this.formReset()}>閉じる</button>
                </li>
              );
            }else{
              return(
                <li key={post.uuid} className="poat-list-item">
                  <div>
                    <a href={user_path}>@{post.user.name}</a><br />
                    {post.content}
                  </div>
                </li>
              );
            }  
          })}
        </ul>

        <input type="text" value={this.state.form.content} onChange={ e => this.handleChange(e, 'content')} />
        <button onClick={() => this.handleCreate()}>投稿</button>

      </React.Fragment>
    );
  }
}

export default PostsIndex
