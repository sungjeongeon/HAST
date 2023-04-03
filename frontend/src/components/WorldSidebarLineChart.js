import React, { PureComponent } from "react";
import { useSelector } from "react-redux";
import {
  ComposedChart,
  Line,
  Area,
  Bar,
  XAxis,
  YAxis,
  CartesianGrid,
  Tooltip,
  Legend,
  ResponsiveContainer,
  ReferenceLine,
} from "recharts";

export default class LineChartExample extends PureComponent {
  constructor(props) {
    //현재 클래스형 컴포넌트가 상속받고 있는
    //리액트의 Component 클래스가 지닌 생성자 함수를 호출해 준다.
    super(props);
    this.state = {
      world_tone: "-",
      country_tone: "-",
    };

    this.customTooltip = this.customTooltip.bind(this);
  }

  customTooltip({ payload, label }) {
    if (payload && payload.length) {
      this.setState({ world_tone: payload[0].payload.world_tone });
      this.setState({ country_tone: payload[0].payload.country_tone });
    }

    return null;
  }
  render() {
    const data = this.props.data;
    const language = this.props.language;

    const gradientOffset = () => {
      const dataMax = Math.max(...data.map((i) => i.world_tone));
      const dataMin = Math.min(...data.map((i) => i.world_tone));
      // const dataSujm = Math.min(...data.map((i) => i.world_tone));

      return dataMax / (dataMax - dataMin);
    };

    const off = gradientOffset();
    return (
      <ResponsiveContainer width="100%" height="58%">
        <ComposedChart
          width={500}
          height={300}
          data={data}
          margin={{ top: 10, right: 20, left: -30, bottom: 10 }}
        >
          <CartesianGrid stroke="#f5f5f5" />
          <XAxis
            dataKey="name"
            interval={0}
            tickLine={false}
            label={{
              value: language === "ko" ? "월" : "month",
              position: "insideBottom",
              offset: -8,
            }}
          />
          <YAxis tickLine={false} />
          <Tooltip
            contentStyle={{ backgroundColor: "#ffffff70" }}
            content={this.customTooltip}
          />
          <defs>
            <linearGradient id="splitColor" x1="0" y1="0" x2="0" y2="1">
              <stop offset={0} stopColor="green" stopOpacity={0.5} />
              <stop offset={off} stopColor="green" stopOpacity={0} />
              <stop offset={1} stopColor="red" stopOpacity={0.5} />
            </linearGradient>
          </defs>
          <Legend
            verticalAlign="top"
            height={36}
            align="right"
            iconType="plainline"
            payload={[
              {
                value:
                  language === "ko"
                    ? `전세계(${this.state.world_tone})`
                    : `world(${this.state.world_tone})`,
                type: "line",
                id: "ID02",
                color: "#ff7300",
              },
              {
                value:
                  language === "ko"
                    ? `해당 국가(${this.state.country_tone})`
                    : `this country(${this.state.country_tone})`,
                type: "line",
                id: "ID01",
                color: "#000",
              },
            ]}
          />
          <ReferenceLine y={0} label="" stroke="gray" strokeDasharray="3 3" />

          <Line
            type="monotone"
            dataKey="world_tone"
            stroke="#ff7300"
            dot={false}
          />
          <Area
            type="monotone"
            dataKey="country_tone"
            stroke="#000"
            fill="url(#splitColor)"
          />
        </ComposedChart>
      </ResponsiveContainer>
    );
  }
}