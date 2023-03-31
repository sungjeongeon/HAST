import React, { PureComponent } from "react";
import {
  PieChart,
  Pie,
  Sector,
  Cell,
  ResponsiveContainer,
  LabelList,
} from "recharts";

// const data = [
//   { name: "Group A", value: 400 },
//   { name: "Group B", value: 300 },
//   { name: "Group C", value: 300 },
//   { name: "Group D", value: 200 },
// ];

const COLORS = ["#0088FE", "#00C49F", "#FFBB28", "#FF8042", "#d14d98"];

const RADIAN = Math.PI / 180;

class RenderCustomizedLabel extends PureComponent {
  render() {
    console.log("props", this.props);
    const {
      cx,
      cy,
      midAngle,
      innerRadius,
      outerRadius,
      percent,
      index,
      name_en,
      name_ko,
    } = this.props;
    const radius = innerRadius + (outerRadius - innerRadius) * 0.5;
    const x = cx + radius * Math.cos(-midAngle * RADIAN);
    const y = cy + radius * Math.sin(-midAngle * RADIAN);

    return (
      <text
        x={x}
        y={y}
        fill="black"
        textAnchor={x > cx ? "start" : "end"}
        dominantBaseline="outside"
      >
        {name_en}
      </text>
    );
  }
}

export default class PieChartExample extends PureComponent {
  constructor(props) {
    super(props);

    this.state = {
      activeMonth: 0,
    };
  }
  render() {
    const month = this.props.month;
    const data = this.props.data.pie;

    return (
      <>
        <p>{month}월</p>
        <ResponsiveContainer width="100%" height="100%">
          <PieChart width={400} height={400}>
            <Pie
              data={data}
              cx="50%"
              cy="50%"
              labelLine={false}
              outerRadius={80}
              fill="#8884d8"
              dataKey="value"
              label={<RenderCustomizedLabel />}
            >
              {data.map((entry, index) => (
                <Cell
                  key={`cell-${index}`}
                  fill={COLORS[index % COLORS.length]}
                />
              ))}

              <LabelList dataKey="name_en" position="outside" fill="yellow" />
            </Pie>
          </PieChart>
        </ResponsiveContainer>
      </>
    );
  }
}