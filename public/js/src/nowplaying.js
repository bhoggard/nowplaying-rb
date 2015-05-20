var Piece = React.createClass({

  getInitialState: function() {
    return {
      title: "", 
      composer: ""
    }
  },

  componentDidMount: function() {
    this.loadData();
    setInterval(this.loadData, 60 * 1000);
  },

  loadData: function() {
    $.get(this.props.source, function(result) {
      this.setState({
        title: result.title,
        composer: result.composer
      });
    }.bind(this));
  },

  render: function() {
    return (
      <div>
        <h2><a target="_blank" href={this.props.url}>{this.props.name}</a></h2>
        <p className="title">{this.state.title}</p>
        <p className="composer">{this.state.composer}</p>
      </div>
    );
  }
});

React.render(<Piece source="/counterstream" name="Counterstream Radio" url="http://counterstreamradio.net/" />, 
             document.getElementById('counterstream'));