import React from "react"
import PropTypes from "prop-types"
class PostsIndex extends React.Component {
  constructor(props){
    super(props)
    this.state = {
      posts: [],
      form: {
        content: ''
      }
    };
    this.getIndex = this.getIndex.bind(this)
    this.handleDelete = this.handleDelete.bind(this)
    this.deletePost = this.deletePost.bind(this)
    this.handleChange = this.handleChange.bind(this)
    this.addPost = this.addPost.bind(this)
    this.formReset = this.formReset.bind(this)
  }

  // componentDidMount(){
  //   this.setState({
  //     posts: this.props.posts
  //   })
  // }

  componentDidMount(){
    this.getIndex();
  }

  getIndex(){
    fetch('/api/v1/posts.json')
    .then(response => {return response.json()} )
    .then(data => {this.setState({ posts: data })} );
  }

  handleDelete(id){
    fetch(`/api/v1/posts/${id}`,
        {
          method: 'DELETE',
          headers: {
            'Content-Type': 'application/json'
          }
        })
    .then(response => {
      this.deletePost(id);
    })
  }

  deletePost(id){
    let posts = this.state.posts.filter(post => post.id != id)
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
      form:{
        content: ""
      }
    })
  }

  render () {
    return (
      <React.Fragment>
        <ul className="post-list">
          {this.state.posts.map( post => {
            return(
              <li className="poat-list-item">
                {post.content}
                <button className="ml-auto border-btn text-danger" onClick={() => this.handleDelete(post.id)}>削除</button>
              </li>
            );
          })}
        </ul>

        <input type="text" value={this.state.form.content} onChange={ e => this.handleChange(e, 'content')} />
        <button onClick={() => this.handleCreate()}>投稿</button>

      </React.Fragment>
    );
  }
}

export default PostsIndex
