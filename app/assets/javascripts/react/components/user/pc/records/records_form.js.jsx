var RecordForm = createReactClass({
  getInitialState: function() {
    return {record: this.props.record};
  },
  componentDidMount: function() {
    //this function is called when first render
  },
  handleSubmit: function(e) {
    e.preventDefault();
    var weight = ReactDOM.findDOMNode(this.refs.weight).value.trim();
    if(!weight) {
      return
    }
    //ここから再開する
  },
  render: function() {
    return (
      <div className="record-form">
        <form className="record-form__form" onSubmit={this.handleSubmit}>
          <input type="text" placeholder="weight" ref="weight" />
          <input type="submit" value="Post" />
        </form>
      </div>
    );
  }
});
